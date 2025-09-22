//
//  HomeTabView.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/9/25.
//

import SwiftUI

struct HomeTabView: View {
    
    init() {
        NavigationUtils.setAppearance(backgroundColor: .systemGray6)
    }
    
    var body: some View {
        TabView {
            Dashboard()
                .tabItem() {
                    Image (systemName: "house.circle.fill")
                    Text ("Dashboard")
                }
            Hitchhikings()
                .tabItem() {
                    Image (systemName: "figure.hiking.circle")
                    Text ("Hitchhiking")
                }
            QRSCannerView()
                .tabItem() {
                    Image(systemName: "qrcode.viewfinder")
                    Text("QR Scanner")
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
