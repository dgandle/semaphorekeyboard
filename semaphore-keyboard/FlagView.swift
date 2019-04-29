//
//  FlagView.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import UIKit

class FlagView: UIView {

    let view0 = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    let view6 = UIView()
    let view7 = UIView()
    var views: [UIView] = []
    var currentIndex = 0 {
        didSet {
            if let disabledIndex = disabledIndex, currentIndex == disabledIndex { return }
            views.forEach { $0.alpha = 0.5; $0.isUserInteractionEnabled = false }
            views[currentIndex].alpha = 1.0
            views[currentIndex].isUserInteractionEnabled = true
        }
    }
    var disabledIndex: Int?
    
    var debugColor: UIColor = .blue {
        didSet {
            views.forEach { $0.backgroundColor = debugColor }
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
        
        let centerView = UIView()
        centerView.backgroundColor = .black
        addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        centerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        centerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        let radius: CGFloat = 100
        let viewSize: CGFloat = 70
        let anchorPointY = ((viewSize / 2.0) + radius) / viewSize
        let anglePerItem: CGFloat = 0.785398
        
        views = [view0, view1, view2, view3, view4, view5, view6, view7]
        for (index, view) in views.enumerated() {
            addSubview(view)
            view.backgroundColor = debugColor
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: viewSize).isActive = true
            view.heightAnchor.constraint(equalToConstant: viewSize).isActive = true
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            view.alpha = 0.5
            view.layer.cornerRadius = viewSize / 2
            view.layer.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            view.transform = CGAffineTransform(rotationAngle: anglePerItem * CGFloat(index) )
        }
        
        currentIndex = 0
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if views[currentIndex] == subview && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }

}
