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

func getImage(for index: Int, and direction: FlagDirection) -> UIImage? {
    switch direction {
    case .left:
        switch index {
        case 0:
            return UIImage(named: "L0")
        case 1:
            return UIImage(named: "L1")
        case 3:
            return UIImage(named: "L3")
        case 4:
            return UIImage(named: "L4")
        case 5:
            return UIImage(named: "L5")
        case 6:
            return UIImage(named: "L6")
        case 7:
            return UIImage(named: "L7")
        default:
            return nil
        }
    case .right:
        switch index {
        case 0:
            return UIImage(named: "R0")
        case 1:
            return UIImage(named: "R1")
        case 2:
            return UIImage(named: "R2")
        case 3:
            return UIImage(named: "R3")
        case 4:
            return UIImage(named: "R4")
        case 5:
            return UIImage(named: "R5")
        case 7:
            return UIImage(named: "R7")
        default:
            return nil
        }
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
