//
//  ViewController.swift
//  semaphoreboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(presentSecondViewController),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentSecondViewController()
    }
    
    @objc private func presentSecondViewController() {
        if isKeyboardExtensionEnabled() {
            self.present(SecondViewController(), animated: false, completion: nil)
        }
    }
    
    @IBAction func didTapGoToSettingsButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)    
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

