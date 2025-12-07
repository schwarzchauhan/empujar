//
//  CameraVM.swift
//  empujar
//
//  Created by Harsh Chauhan on 12/8/25.
//

import Foundation
import CoreImage
import Observation

@Observable
class CameraVM {
    var currentFrame: CGImage?
    private let cameraManager = CameraManager()
    
    init() {
        Task {
            await handleCameraPreviews()
        }
    }
    
    func handleCameraPreviews() async {
        for await image in cameraManager.previewStream {
            Task { @MainActor in
                currentFrame = image
            }
        }
    }
}


