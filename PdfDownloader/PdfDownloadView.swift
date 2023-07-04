//
//  PdfDownloadView.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import SwiftUI
//MARK: Url example https://www.pdf995.com/samples/pdf.pdf


struct PdfDownloadView: View {
    @ObservedObject var vm = PDFDownloadVM()
    @State var showPDF = false
    
    var body: some View {
        VStack {
            Text(Strings.HomeStrings.mainTitle.rawValue.localize)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 100)
            Text(Strings.HomeStrings.insertUrl.rawValue.localize)
                .font(.headline)
            //            mirar texfield book masterview y cambiar formatos
            TextField("Insert URL", text: $vm.textFieldText)
                .textFieldStyle(.roundedBorder)
            Text(Strings.HomeStrings.insertName.rawValue.localize)
                .font(.headline)
            //            mirar texfield book masterview y cambiar formatos
            TextField("Insert name", text: $vm.pdfName)
                .textFieldStyle(.roundedBorder)
            Button {
                vm.getPDF()
            } label: {
                Text("Download PDF")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            List(vm.pdfArray, id: \.self) { item in // asignamos nosotros el id
                Button(item) {
                    vm.selectedPDF = item
                    showPDF.toggle()
                }
            }
            Spacer()

        }
        .alert("Something went wrong", isPresented: $vm.errorAlertPresented) {
            
        } message: {
            Text(vm.errorMessage)
        }
        .alert("PDF Descargado", isPresented: $vm.alertPresented) {
            Button("Visualize") {
                vm.selectedPDF = "\(vm.pdfName).pdf"
                showPDF.toggle()
            }
        } message: {
            Text("Want to open the pdf file now?")
        }
        .sheet(isPresented: $showPDF, content: {
            if let getFileURL = vm.getFileURLDocumentsDirectory() {
                PDFKitView(url: getFileURL)
            }
        })
         .padding()
    }
}

struct PdfDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        PdfDownloadView()
            .preferredColorScheme(.dark)
    }
}
