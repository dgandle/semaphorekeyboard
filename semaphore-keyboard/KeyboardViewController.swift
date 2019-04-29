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
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        keyboardView = objects.first as? KeyboardView
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        
        // 3
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            keyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            keyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
            ])
        
        setupGestureRecognizer(for: keyboardView)
        
        view.addSubview(indexLabel)
        indexLabel.text = "Index: "
        
        
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        inputView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
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
        indexLabel.text = "Index: \(index)"
        flagView.currentIndex = index
    }

    
    /**
     * Fetches angle relative to view center point
     * 12 o'clock is 270 degrees, 3 o'clock is 0 degrees
     *
     * From https://stackoverflow.com/a/7805311
     */
    private func getAngleInRadians(for point: CGPoint, in view: UIView) -> CGFloat {
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
    
    private func getAngleInDegrees(for point: CGPoint, in view: UIView) -> CGFloat {
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
}
