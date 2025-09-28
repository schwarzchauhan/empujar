//
//  HomeTabView.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/9/25.
//

import SwiftUI

struct HomeTabView: View {
    
    private var pages: [EmpujarPage] = [.dashboard, .hitchhikings, .qrScanner, .kitInSwiftUiEx, .myViewBuilderEx]
    init() {
        NavigationUtils.setAppearance(backgroundColor: .systemGray6)
    }
    
    
    var body: some View {
        TabView {
            ForEach(pages, id: \.self) { page in
                switch page {
                case .dashboard:
                    Dashboard()
                        .tabItem() {
                            Image (systemName: "house.circle.fill")
                            Text ("Dashboard")
                        }
                case .hitchhikings:
                    Hitchhikings()
                        .tabItem() {
                            Image (systemName: "figure.hiking.circle")
                            Text ("Hitchhiking")
                        }
                case .qrScanner:
                    QRSCannerView()
                        .tabItem() {
                            Image(systemName: "qrcode.viewfinder")
                            Text("QR Scanner")
                        }
                case .kitInSwiftUiEx:
                    KitInSwiftUiEx()
                        .tabItem() {
                            Image(systemName: "character.textbox.badge.sparkles")
                            Text("Kit in SwiftUI")
                        }
                case .myViewBuilderEx:
                    MyViewBuilderEx()
                        .tabItem() {
                            Image(systemName: "square.and.pencil.circle")
                            Text("View Builder example")
                        }
                }
            }
            // TODO: - HARSH CHAUHAN add badges as well
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

enum EmpujarPage {
    case dashboard
    case hitchhikings
    case qrScanner
    case kitInSwiftUiEx
    case myViewBuilderEx
}
