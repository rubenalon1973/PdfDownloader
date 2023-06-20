//
//  PdfDownloadView.swift
//  PdfDownloader
//
//  Created by Ruben Alonso on 18/6/23.
//

import SwiftUI

struct PdfDownloadView: View {
    @ObservedObject var vm = PDFDownloadVM()
    
       
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
            Text(Strings.HomeStrings.insertUrl.rawValue.localize)
                .font(.headline)
            //            mirar texfield book masterview y cambiar formatos
            TextField("Insert name to save PDF", text: $vm.pdfName)
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
                    
                }
            }
            Spacer()

        }
        .alert("NO CAMPOS VACIOS", isPresented: $vm.alertPresented) {
            
        } message: {
            Text("No puede haber campos vacíos, cumplimentelos")
        }
         .padding()
    }
}

struct PdfDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        PdfDownloadView()
            .preferredColorScheme(.dark)
    }
}
