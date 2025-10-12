//
//  ViewController.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/7/25.
//

import UIKit
import SwiftUI
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. Create an instance of your SwiftUI view
        let homeTabView = HomeTabView()
        
        // 3. Create a UIHostingController with your SwiftUI view
        let hostingController = UIHostingController(rootView: homeTabView)
        
        // 4. Add the hosting controller as a child of this view controller
        addChild(hostingController)
        
        // 5. Add the hosting controller's view to this view controller's view
        view.addSubview(hostingController.view)
        
        // 6. Set up constraints to make the SwiftUI view fill the entire screen
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // 7. Notify the hosting controller that it has been moved to a parent
        hostingController.didMove(toParent: self)
        
        DipatchBarrierDemoVM().buyTickets()
    }
}
