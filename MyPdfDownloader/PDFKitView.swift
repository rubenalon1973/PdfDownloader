//
//  PDFKitView.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 23/6/23.
//

import SwiftUI
//Framework para trabajar con archivos pdf
import PDFKit
//Al ser una vista basada en UIKit, utilizamos UIViewRepresentable para utilizarla en SwiftUI
struct PDFKitView: UIViewRepresentable {
    let url: URL
//    para crear y config un obj de la vista PDFView de PDFKit
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        let pdfView = PDFView()//creamos la inst vacía para crear un objeto y trabajar con el
        pdfView.autoScales = true// con esta prop se ajusta el pdf a la vista
        pdfView.document = PDFDocument(url: url)//para cargar el pdf desde la url especificada
        return pdfView
    }
//    esta no la usamos pero el protocolo UIViewRepresentable la requiere
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {}
}
