//
//  UserInteractionManager.swift
//  FIBank-Nikolay-Kovachev
//
//  Created by KNG on 17.04.24.
//

import Foundation
import UIKit

final class UserInteractionManager {
    static private var userInteractionTimer = Timer()
    
    static func startTimer() {
        self.stopTimer()
        self.userInteractionListener()
    }
    
    static func stopTimer() {
        userInteractionTimer.invalidate()
    }
    
    static private func userInteractionListener() {
        userInteractionTimer = Timer.scheduledTimer(withTimeInterval: 300.0, repeats: true, block: { _ in
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first,
               let rootViewController = window.rootViewController as? UINavigationController {
                rootViewController.popToRootViewController(animated: true)
                self.stopTimer()
            }
        })
    }
}
