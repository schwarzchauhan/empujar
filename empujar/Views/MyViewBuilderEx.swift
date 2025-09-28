//
//  MyViewBuilderEx.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/28/25.
//

import SwiftUI

struct MyViewBuilderEx: View {
    @State var isEditable: Bool = false
    @State var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            editableView
            editableBuilderView
        }
        .padding(0)
        .type()
    }
    
    
    
    private var editableView: some View {
        if isEditable {
            return AnyView(TextField("Enter the name", text: $name))
        } else {
            return AnyView(Text(name))
        }
    }
    
    @ViewBuilder // no need of explicit return here
    private var editableBuilderView: some View {
        if isEditable {
            TextField("Enter the name", text: $name)
        } else {
            Text(name)
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
