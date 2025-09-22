//
//  CameraManager.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/22/25.
//

import Foundation
import AVFoundation

// TODO: - HARSH CHAUHAN https://www.createwithswift.com/camera-capture-setup-in-a-swiftui-app/
class CameraManager: NSObject {
    // 1.
    private let captureSession = AVCaptureSession()
    // 2.
    private var deviceInput: AVCaptureDeviceInput?
    // 3.
    private var videoOutput: AVCaptureVideoDataOutput?
    // 4.
    private let systemPreferredCamera = AVCaptureDevice.default(for: .video)
    // 5.
    private var sessionQueue = DispatchQueue(label: "video.preview.session")
    
    private var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            // Determine if the user previously authorized camera access.
            var isAuthorized = status == .authorized
            
            // If the system hasn't determined the user's authorization status,
            // explicitly prompt them for approval.
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
}
