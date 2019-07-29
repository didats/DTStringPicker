//
//  DTPickerPresenter.swift
//  Academy
//
//  Created by Didats Triadi on 17/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerPresenter {
    init() {
        
    }
    
    func dismiss(constraint: NSLayoutConstraint, viewController: UIViewController) {
        constraint.constant = UIScreen.main.bounds.size.height
        UIView.animate(withDuration: 0.1, animations: {
            viewController.view.layoutIfNeeded()
        }) { (_) in
            viewController.dismiss(animated: false, completion: nil)
        }
    }
    
    func showing(constraint: NSLayoutConstraint, viewController: UIViewController) {
        constraint.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            viewController.view.layoutIfNeeded()
        })
    }
}
