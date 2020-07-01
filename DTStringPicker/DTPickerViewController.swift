//
//  DTPickerViewController.swift
//  Academy
//
//  Created by Didats Triadi on 17/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerViewController: UIViewController {
    
    private var tableView = UITableView(frame: CGRect.zero)
    private var bgImage = UIImageView(frame: CGRect.zero)
    private var dismissButton = UIButton(frame: CGRect.zero)
    private var boxView = DTPickerView(frame: CGRect.zero)
    private var titleLabel = UILabel(frame: CGRect.zero)
    
    var config: DTStringPickerConfig!
    var list: [String] = []
    var background: UIImage?
    var router: DTPickerRouter!
    var clicked: ((_ selected: Int, _ title: String) -> Void)?
    var cancel: (() -> Void)?
    
    var constraintBottom: NSLayoutConstraint!
    var constraintHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = DTPickerRouter(controller: self)
        
        let views: [UIView] = [bgImage, dismissButton, boxView, tableView]
        var i = 0
        views.forEach { (item) in
            if item.superview == nil {
                if i > 2 {
                    boxView.addSubview(item)
                }
                else {
                    view.addSubview(item)
                }
            }
            item.translatesAutoresizingMaskIntoConstraints = false
            i += 1
        }
        
        tableView.delegate = router
        tableView.dataSource = router
        
        view.backgroundColor = UIColor.clear
        
        bgImage.image = background
        
        boxView.backgroundColor = config.backgroundColor
        boxView.layer.shadowColor = config.shadowColor.cgColor
        boxView.layer.shadowOpacity = 0.15
        boxView.layer.shadowRadius = 5
        boxView.layer.shadowOffset = CGSize(width: 0, height: -5)
        boxView.layer.masksToBounds = false
        boxView.layer.cornerRadius = 12
        
        
        dismissButton.backgroundColor = UIColor.black
        dismissButton.alpha = 0.4
        
        dismissButton.tapped { [unowned self] in self.router.dismiss() }
        boxView.dismiss = { [unowned self] in self.router.dismiss() }
        
        constraintBottom = boxView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: UIScreen.main.bounds.size.height)
        
        constraintHeight = boxView.heightAnchor.constraint(equalToConstant: router.height())
        
        view.addConstraints([
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            constraintHeight,
            constraintBottom,
            boxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: boxView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: boxView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: boxView.trailingAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.router.showing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constraintHeight.constant = router.height()
        view.layoutIfNeeded()
    }
}
