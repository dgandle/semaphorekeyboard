//
//  Utilities.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import Foundation
import UIKit

extension UIGestureRecognizer {
    func cancel() {
        self.isEnabled = false
        self.isEnabled = true
    }
}

/**
 * Fetches angle relative to view center point
 * 12 o'clock is 270 degrees, 3 o'clock is 0 degrees
 *
 * From https://stackoverflow.com/a/7805311
 */
func getAngleInRadians(for point: CGPoint, in view: UIView) -> CGFloat {
    let dx = point.x - view.frame.width / 2
    let dy = -(point.y - view.frame.height / 2)
    
    var inRadians = atan2(dy, dx)
    
    if inRadians < 0 {
        inRadians = abs(inRadians)
    } else {
        inRadians = 2 * CGFloat.pi - inRadians
    }
    
    return inRadians
}

func getAngleInDegrees(for point: CGPoint, in view: UIView) -> CGFloat {
    let dx = point.x - view.frame.width / 2
    let dy = -(point.y - view.frame.height / 2)
    
    var inRadians = atan2(dy, dx)
    
    if inRadians < 0 {
        inRadians = abs(inRadians)
    } else {
        inRadians = 2 * CGFloat.pi - inRadians
    }
    
    return inRadians * 180 / CGFloat.pi
}
