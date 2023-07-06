//
//  PDFDownloadVM.swift
//  MyPdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import Foundation

final class PDFDownloadVM: ObservableObject {
    let persistence = PdfPersistence.shared
    
    @Published var textFieldText = ""
    @Published var pdfName = ""
    @Published var alertPresented = false
    @Published var errorAlertPresented = false
    @Published var pdfArray:[String] = []
    @Published var selectedPDF = ""
    @Published var errorMessage = ""
    
    init() {
        recoverAllPdfs()
    }
    
    func getPDF() {
        guard !textFieldText.isEmpty,
              !pdfName.isEmpty,
              let pdfURl = URL(string: textFieldText) else {
            errorMessage = Strings.HomeStrings.errorMessage.rawValue.localize
            errorAlertPresented.toggle()
            return
        }
        
        Task {
            do {
                try await persistence.downloadPdf(url: pdfURl, pdfName: pdfName)
                await MainActor.run {
                    pdfArray.append(pdfName + ".pdf")
                    alertPresented.toggle()
                }
            } catch let error as DownloadErrors {
                await MainActor.run {
                    errorMessage = error.rawValue
                    errorAlertPresented = true
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func recoverAllPdfs() {
        guard let documentsURL = persistence.getDocumentDirectory() else { return }
        
        do {
            let document = try FileManager.default.contentsOfDirectory(atPath: documentsURL.path())
                .sorted()
                .dropFirst()
            pdfArray.append(contentsOf: document)
        } catch {
            pdfArray = []
        }
    }
    
    func getFileURLDocumentsDirectory() -> URL? {
        guard let documentsDirectory = persistence.getDocumentDirectory() else { return nil }
        
        let fileURL = documentsDirectory.appendingPathComponent(selectedPDF) //urlDocuments.AAA.pdf
        return fileURL
    }
    
    func cleanFields() {
        textFieldText = ""
        pdfName = ""
    }
}

