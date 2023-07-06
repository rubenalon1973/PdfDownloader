//
//  PDFKitView.swift
//  MyPdfDownloader
//
//  Created by Ruben Alonso on 23/6/23.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = PDFDocument(url: url)
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {}
}
