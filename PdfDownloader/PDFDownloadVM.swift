//
//  PDFDownloadVM.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import Foundation

final class PDFDownloadVM: ObservableObject {
    let persistence = PdfPersistence.shared
    
    @Published var textFieldText = ""
    @Published var pdfName = ""
    @Published var alertPresented = false
    @Published var pdfArray:[String] = []
    @Published var errorMessage = ""
    
    //    @MainActor
    func getPDF() {
        guard !textFieldText.isEmpty,
              !pdfName.isEmpty,
              let pdfURl = URL(string: textFieldText) else {
            errorMessage = "No puede haber campos vacíos"
            alertPresented.toggle()
            return
        }
        
        Task {
            do {
                try await persistence.downloadPdf(url: pdfURl, pdfName: pdfName)
                await MainActor.run {//para acotar aún más el main actor
                    pdfArray.append(pdfName + ".pdf")
                }
            } catch let error as DownloadErrors {
                await MainActor.run {
                    errorMessage = error.rawValue
                    alertPresented = true
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

