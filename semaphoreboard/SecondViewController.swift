//
//  SecondViewController.swift
//  semaphoreboard
//
//  Created by Doug Gandle on 5/2/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
        textField.alpha = 0.0
        
        setupInstructionsLabel()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeInputMode(_:)),
                                               name: UITextInputMode.currentInputModeDidChangeNotification,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !isKeyboardExtensionEnabled() {
            self.present(ViewController(), animated: false, completion: nil)
        }
    }
    
    private func setupInstructionsLabel() {
        let attributedString = NSMutableAttributedString(string: "Tap and hold the globe key and select Flag Semaphore from the menu")
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: "globe_15")
        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
        attributedString.replaceCharacters(in: NSRange(location: 17, length: 5), with: attrStringWithImage)
        
        let boldText = "Flag Semaphore"
        let attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
        let boldString = NSMutableAttributedString(string: boldText, attributes:attrs)
        attributedString.replaceCharacters(in: NSRange(location: 34, length: 14), with: boldString)
        
        instructionsLabel.attributedText = attributedString
    }
    
    @objc func changeInputMode(_ notification: Notification) {
        guard textField.textInputMode?.value(forKey: "displayName") as? String == "Flag Semaphore" else { return }
        
        DispatchQueue.main.async {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [.calculationModeCubic], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    self.imageView.alpha = 0.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    self.textField.alpha = 1.0
                })
            }, completion: { _ in
                print("\(self.imageView.frame)")
            })
        }
        
    }

}
