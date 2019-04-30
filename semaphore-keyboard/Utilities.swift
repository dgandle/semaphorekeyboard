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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
