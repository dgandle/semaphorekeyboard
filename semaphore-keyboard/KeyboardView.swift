//
//  KeyboardView.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit
import AudioToolbox

protocol FlagViewDelegate {
    func didTapSubmit(with semaphorePosition: SemaphorePosition)
}

class KeyboardView: UIView {

    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    var delegate: FlagViewDelegate?
    
    let leftFlagView = FlagView()
    let rightFlagView = FlagView()
    
    let shiftButton = KeyboardButton()
    let nextKeyboardButton = KeyboardButton()
    let submitButton = KeyboardButton(text: "Submit")
    
    var debugMode = false {
        didSet {
            if debugMode {
                rightFlagView.debugColor = .blue
                rightFlagView.centerView.isHidden = false
                leftFlagView.debugColor = .red
                leftFlagView.centerView.isHidden = false
            } else {
                rightFlagView.debugColor = .clear
                rightFlagView.centerView.isHidden = true
                leftFlagView.debugColor = .clear
                leftFlagView.centerView.isHidden = true
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        
        rightFlagView.direction = .right
        self.addSubview(rightFlagView)
        rightFlagView.translatesAutoresizingMaskIntoConstraints = false
        rightFlagView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20).isActive = true
        rightFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rightFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        rightFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 50).isActive = true
        
        leftFlagView.direction = .left
        self.addSubview(leftFlagView)
        leftFlagView.translatesAutoresizingMaskIntoConstraints = false
        leftFlagView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20).isActive = true
        leftFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -50).isActive = true
        leftFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        shiftButton.addTarget(self, action: #selector(didTapShiftButton(_:)), for: .touchUpInside)
        shiftButton.setImage(UIImage(named: "shift"), for: .normal)
        self.addSubview(shiftButton)
        shiftButton.translatesAutoresizingMaskIntoConstraints = false
        shiftButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        shiftButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        shiftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        shiftButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        nextKeyboardButton.addTarget(self, action: #selector(didTapNextKeyboardButton(_:)), for: .touchUpInside)
        nextKeyboardButton.setImage(UIImage(named: "globe"), for: .normal)
        self.addSubview(nextKeyboardButton)
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        nextKeyboardButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        nextKeyboardButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        nextKeyboardButton.leadingAnchor.constraint(equalTo: shiftButton.trailingAnchor, constant: 4).isActive = true
        nextKeyboardButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton(_:)), for: .touchUpInside)
        self.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.widthAnchor.constraint(equalToConstant: 88).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
    @objc func didTapShiftButton(_ sender: Any) {
        AudioServicesPlaySystemSound(1156)
        // set caps, maybe on delegate?
    }
    
    @objc func didTapNextKeyboardButton(_ sender: Any) {
        AudioServicesPlaySystemSound(1156)
        // delegate call to switch keybaords
    }
    
    @objc func didTapSubmitButton(_ sender: Any) {
        AudioServicesPlaySystemSound(1156)
        let position = SemaphorePosition(left: leftFlagView.currentIndex, right: rightFlagView.currentIndex)
        delegate?.didTapSubmit(with: position)
    }

}

