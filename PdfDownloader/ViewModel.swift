//
//  ViewModel.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import Foundation

final class PDFDownloadViewModel: ObservableObject {
    @Published var textFieldText = ""
    @Published var pdfName = ""
    @Published var alertPresented = false
    
    func downloadPDF() {
        guard !textFieldText.isEmpty, !pdfName.isEmpty else {
            alertPresented.toggle()
            return
        }
//        podemos hacer prints para ver si fx
        print(textFieldText)
        print(pdfName)
    }
}
