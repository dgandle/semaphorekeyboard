//
//  KeyboardView.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

class KeyboardView: UIView {

    let leftFlagView = FlagView()
    let rightFlagView = FlagView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        leftFlagView.disabledIndex = 6
        self.addSubview(leftFlagView)
        leftFlagView.translatesAutoresizingMaskIntoConstraints = false
        leftFlagView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80).isActive = true
        
        rightFlagView.debugColor = .red
        rightFlagView.disabledIndex = 2
        self.addSubview(rightFlagView)
        rightFlagView.translatesAutoresizingMaskIntoConstraints = false
        rightFlagView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rightFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80).isActive = true
        rightFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

}
