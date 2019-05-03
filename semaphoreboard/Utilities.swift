//
//  Utilities.swift
//  semaphoreboard
//
//  Created by Doug Gandle on 5/2/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import Foundation

public func isKeyboardExtensionEnabled() -> Bool {
    guard let appBundleIdentifier = Bundle.main.bundleIdentifier else {
        fatalError("isKeyboardExtensionEnabled(): Cannot retrieve bundle identifier.")
    }
    
    guard let keyboards = UserDefaults.standard.dictionaryRepresentation()["AppleKeyboards"] as? [String] else {
        // There is no key `AppleKeyboards` in NSUserDefaults. That happens sometimes.
        return false
    }
    
    let keyboardExtensionBundleIdentifierPrefix = appBundleIdentifier + "."
    for keyboard in keyboards {
        if keyboard.hasPrefix(keyboardExtensionBundleIdentifierPrefix) {
            return true
        }
    }
    
    return false
}
