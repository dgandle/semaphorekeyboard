//
//  KeyboardButton.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/29/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit
import AudioToolbox

class KeyboardButton: UIButton {
    
    var text: String
    var isSticky = false
    
    let defaultColor = UIColor(red:0.82, green:0.85, blue:0.88, alpha:1.0)
    let selectedColor = UIColor(red:0.96, green:0.96, blue:0.98, alpha:1.0)
    let shadowColor = UIColor(red:0.18, green:0.21, blue:0.25, alpha:1.0)

    convenience init() {
        self.init(text: "")
    }
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = ""
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = defaultColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.35
        self.layer.shadowRadius = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        self.setTitle(text, for: .normal)
        self.setTitleColor(shadowColor, for: .normal)
        
        self.addTarget(self, action: #selector(playKeyboardClick), for: .touchDown)
    }
    
    override open var isHighlighted: Bool {
        didSet {
            guard !isSticky || !isSelected else { return }
            backgroundColor = isHighlighted ? selectedColor : defaultColor
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
        }
    }
    
    @objc func playKeyboardClick() {
        AudioServicesPlaySystemSound(1156)
    }

}
