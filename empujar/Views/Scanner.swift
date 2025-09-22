//
//  Scanner.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/22/25.
//

import SwiftUI
import Vision

struct QRSCannerView: View {
    
//    @State var qrData = ""
    
//    let qrImage = UIImage(named: "qrcode")
    
    var body: some View {
        VStack {
//            Image(uiImage: qrImage!)
//                .resizable()
//                .scaledToFit()
            
            Button("Take A Picture") {
                
            }
            
//            Button("Extract QR Data"){
//                qrData =   extractQRCode(image: qrImage!)!
//            }
//            Text(qrData)
        }
        .padding()
        
    }
    
    private func extractQRCode(image: UIImage) -> String? {
        let qrImage = image
        let cgImage = qrImage.cgImage
        
        // Request handler
        let handler = VNImageRequestHandler(cgImage: cgImage!)
        
        let barcodeRequest = VNDetectBarcodesRequest()
        barcodeRequest.symbologies = [.qr]
        
        // Process the request
        try?handler.perform([barcodeRequest])
        
        // Get data from QR
        guard let results = barcodeRequest.results, let firstBarcode = results.first?.payloadStringValue else {
            return nil
        }
        print(firstBarcode)
        return firstBarcode
    }
}


#Preview {
    QRSCannerView()
}
