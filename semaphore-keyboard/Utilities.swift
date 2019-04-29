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
