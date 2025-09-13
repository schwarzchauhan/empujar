//
//  Dasboard.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/9/25.
//


import SwiftUI

struct Hitchhikings: View {
    var body: some View {
        VStack {
            Text("Hello, Hitchhiker's!")
            
            Image(systemName: "figure.hiking.circle.fill")
                .resizable()
                .frame(width: 200, height: 200)
            Vivienda()
        }
    }
}

struct Hitchhikings_Previews: PreviewProvider {
    static var previews: some View {
        Hitchhikings()
    }
}
