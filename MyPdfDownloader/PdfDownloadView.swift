//
//  PdfDownloadView.swift
//  MyPdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import SwiftUI
//MARK: Url example https://www.pdf995.com/samples/pdf.pdf


struct PdfDownloadView: View {
    @ObservedObject var vm = PDFDownloadVM()
    @State var showPDF = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Strings.HomeStrings.mainTitle.rawValue.localize)
                .font(.largeTitle)
                .tracking(-3)
                .foregroundColor(.accentColor)
                .padding(.bottom, 100)
            Text(Strings.HomeStrings.insertUrl.rawValue.localize)
                .font(.headline)
            TextField(Strings.HomeStrings.texfieldInsertUrl.rawValue.localize, text: $vm.textFieldText)
                .textFieldStyle(.roundedBorder)
            //                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
            Text(Strings.HomeStrings.insertName.rawValue.localize)
                .font(.headline)
            TextField(Strings.HomeStrings.texfieldInsertName.rawValue.localize, text: $vm.pdfName)
                .textFieldStyle(.roundedBorder)
            //                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
            Button {
                vm.getPDF()
            } label: {
                Text(Strings.HomeStrings.downloadPdf.rawValue.localize)
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
        .alert(Strings.HomeStrings.alertWrong.rawValue.localize, isPresented: $vm.errorAlertPresented) {
            
        } message: {
            Text(vm.errorMessage)
        }
        .alert(Strings.HomeStrings.alertDownloadPdf.rawValue.localize, isPresented: $vm.alertPresented) {
            Button(Strings.HomeStrings.buttonVisualize.rawValue.localize) {
                vm.selectedPDF = "\(vm.pdfName).pdf"
                showPDF.toggle()
            }
        } message: {
            Text(Strings.HomeStrings.textOpenFile.rawValue.localize)
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


