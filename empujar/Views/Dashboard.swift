//
//  Dashboard.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/9/25.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            Image(systemName: "brain.filled.head.profile")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
