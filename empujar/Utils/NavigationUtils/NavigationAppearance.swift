//
//  NavigationAppearance.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/11/25.
//

import SwiftUI
import UIKit

struct NavigationUtils {
    
    static func setAppearance(backgroundColor: UIColor) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

