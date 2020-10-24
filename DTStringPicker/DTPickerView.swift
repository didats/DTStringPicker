//
//  DTPickerView.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 18/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerView: UIView {
    
    private var gesture: UIGestureRecognizer!
    private var firstPoint: CGPoint = CGPoint.zero
    
    var dismiss: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        generateView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        generateView()
    }
    
    private func generateView() {
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        clipsToBounds = true
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: -5)
        layer.masksToBounds = false
        layer.cornerRadius = 12
        
        gesture = UIPanGestureRecognizer(target: self, action: #selector(DTPickerView.pan(_:)))
        addGestureRecognizer(gesture)
    }
    
    @objc private func pan(_ gesture: UIPanGestureRecognizer) {
        let translate = gesture.translation(in: self)
        let newCenter = CGPoint(x: firstPoint.x, y: firstPoint.y + translate.y)
        
        if gesture.state == .began {
            firstPoint = center
        }
        else if gesture.state == .changed {
            if newCenter.y < firstPoint.y {}
            else {
                self.center = newCenter
            }
        }
        else if gesture.state == .ended {
            if newCenter.y > (UIScreen.main.bounds.size.height / 4) {
                self.dismiss?()
            }
            else {
                UIView.animate(withDuration: 0.2) {
                    self.center = self.firstPoint
                }
            }
        }
    }
}
