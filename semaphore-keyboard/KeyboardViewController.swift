//
//  KeyboardViewController.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    private lazy var leftPan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    private lazy var rightPan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    
    let indexLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))

    var keyboardView: KeyboardView!
    
    var debugMode = true
    
    private var shift: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardView()
        
        view.addSubview(indexLabel)
        indexLabel.text = "Index: "
        
        indexLabel.isHidden = !debugMode
    }
    
    override func viewDidAppear(_ animated: Bool) {
        keyboardView.setNextKeyboardVisible(needsInputModeSwitchKey)
        keyboardView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    private func setupKeyboardView() {
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        keyboardView = objects.first as? KeyboardView
        guard let inputView = view else { return }
        inputView.addSubview(keyboardView)

        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            keyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            keyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            keyboardView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
        keyboardView.delegate = self
        setupGestureRecognizer(for: keyboardView)
        
        keyboardView.debugMode = debugMode
    }

    private func setupGestureRecognizer(for view: UIView) {
        view.isUserInteractionEnabled = true
        
        keyboardView.leftFlagView.addGestureRecognizer(leftPan)
        keyboardView.rightFlagView.addGestureRecognizer(rightPan)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        guard let flagView = sender.view as? FlagView else { return }
        let location = sender.location(in: flagView)
        let degrees = getAngleInDegrees(for: location, in: flagView)
        guard let index = getIndexFrom(degrees: degrees) else { return }

        if sender.state == .began {
            if index != flagView.currentIndex {
                sender.cancel()
            } else {
                moveFlagTo(index: index, for: flagView)
            }
        } else if sender.state == .changed {
            moveFlagTo(index: index, for: flagView)
        }
    }
    
    private func getIndexFrom(degrees angle: CGFloat) -> Int? {
        switch angle {
        case 0..<22.5:
            return 2
        case 22.5..<67.5:
            return 3
        case 67.5..<112.5:
            return 4
        case 112.5..<157.5:
            return 5
        case 157.5..<202.5:
            return 6
        case 202.5..<247.5:
            return 7
        case 247.5..<292.5:
            return 0
        case 292.5..<337.5:
            return 1
        case 292.5..<360:
            return 2
        default:
            return nil
        }
    }
    
    private func moveFlagTo(index: Int, for flagView: FlagView) {
        flagView.setCurrentIndex(index)
        indexLabel.text = "Index: \(flagView.currentIndex)"
        guard let image = getImage(for: index, and: flagView.direction) else { return }
        switch flagView.direction {
        case .left:
            keyboardView.leftImageView.image = image
        case .right:
            keyboardView.rightImageView.image = image
        }
        setCharacterLabelText()
    }
    
    private func setCharacterLabelText() {
        let leftIndex = keyboardView.leftFlagView.currentIndex
        let rightIndex = keyboardView.rightFlagView.currentIndex
        let position = SemaphorePosition(left: leftIndex, right: rightIndex)
        let semaphoreCharacter = semaphoreDictionary[position]
        keyboardView.setCharacterLabel(character: semaphoreCharacter)
    }
    
}

extension KeyboardViewController: FlagViewDelegate {
    func didTapSubmit(with semaphorePosition: SemaphorePosition) {
        indexLabel.text = "left: \(semaphorePosition.left), right: \(semaphorePosition.right)"
        guard let semaphoreCharacter = semaphoreDictionary[semaphorePosition] else { return }
        guard let string = semaphoreCharacter.toString else {
            textDocumentProxy.deleteBackward()
            return
        }
        let shiftedString = shift ? string.uppercased() : string.lowercased()
        textDocumentProxy.insertText(shiftedString)
    }
    
    func didTapShiftButton(isSelected: Bool) {
        self.shift = isSelected
    }
}
