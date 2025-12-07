//
//  MyViewBuilderEx.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/28/25.
//

import SwiftUI

struct MyViewBuilderEx: View {
    @State private var vm = CameraVM()
    
    
    
    var body: some View {
        CamerView(image: $vm.currentFrame)
    }
}


struct CamerView: View {
    @Binding var image: CGImage?
    
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                Image(decorative: image, scale: 1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
            } else {
                ContentUnavailableView("No camera feed", systemImage: "xmark.circle.fill")
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
            }
        }
    }
}

extension View {
    func type() -> some View {
        print(Swift.type(of: self))
        // swiftui makess a tuple view based on heirarchy
        return self
    }
}
