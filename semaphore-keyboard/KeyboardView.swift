//
//  KeyboardView.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

protocol FlagViewDelegate {
    func didTapSubmit(with semaphorePosition: SemaphorePosition)
}

class KeyboardView: UIView {

    @IBOutlet weak var submitButton: UIButton!
    
    var delegate: FlagViewDelegate?
    
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
        rightFlagView.disabledIndex = 6
        self.addSubview(rightFlagView)
        rightFlagView.translatesAutoresizingMaskIntoConstraints = false
        rightFlagView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rightFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        rightFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80).isActive = true
        
        leftFlagView.debugColor = .red
        leftFlagView.disabledIndex = 2
        self.addSubview(leftFlagView)
        leftFlagView.translatesAutoresizingMaskIntoConstraints = false
        leftFlagView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftFlagView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftFlagView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80).isActive = true
        leftFlagView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    @IBAction func didTapSubmitButton(_ sender: Any) {
        let position = SemaphorePosition(left: leftFlagView.currentIndex, right: rightFlagView.currentIndex)
        delegate?.didTapSubmit(with: position)
    }

}
