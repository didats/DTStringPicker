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
    private var imageView = UIImageView(frame: CGRect.zero)
    private var buttonDismiss = UIButton(frame: CGRect.zero)
    private var viewBox = DTPickerView(frame: CGRect.zero)
    private var buttonArrow = UIButton(frame: CGRect.zero)
    private var buttonCancel = UIButton(frame: CGRect.zero)
    
    var config: DTStringPickerConfig!
    var list: [String] = []
    var background: UIImage?
    var router: DTPickerRouter!
    var clicked: ((_ selected: Int, _ title: String) -> Void)?
    var cancel: (() -> Void)?
    
    var constraintBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = DTPickerRouter(controller: self)
        
        let views: [UIView] = [imageView, buttonDismiss, viewBox, buttonArrow, tableView, buttonCancel]
        var i = 0
        views.forEach { (item) in
            if item.superview == nil {
                if i > 2 {
                    viewBox.addSubview(item)
                }
                else {
                    view.addSubview(item)
                }
            }
            item.translatesAutoresizingMaskIntoConstraints = false
            i += 1
        }
        buttonArrow.setTitle("⇓", for: .normal)
        buttonArrow.setTitleColor(config.color, for: .normal)
        buttonArrow.tapped { [unowned self] in self.router.dismiss()  }
        
        tableView.delegate = router
        tableView.dataSource = router
        
        view.backgroundColor = UIColor.clear
        
        imageView.image = background
        viewBox.backgroundColor = config.backgroundColor
        viewBox.layer.cornerRadius = 10
        viewBox.layer.masksToBounds = true
        
        buttonDismiss.backgroundColor = UIColor.black
        buttonDismiss.alpha = 0.4
        
        buttonDismiss.tapped { [unowned self] in self.router.dismiss() }
        viewBox.dismiss = { [unowned self] in self.router.dismiss() }
        
        constraintBottom = viewBox.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: UIScreen.main.bounds.size.height)
        
        var height = UIScreen.main.bounds.size.height / 1.5
        let dynamicHeight: CGFloat = CGFloat((70 * list.count) + 80)
        if dynamicHeight < height {
            height = dynamicHeight
        }
        
        buttonCancel.backgroundColor = config.color.withAlphaComponent(0.3)
        buttonCancel.setTitle(config.cancelTitle, for: .normal)
        buttonCancel.titleLabel?.font = config.cancelFont
        buttonCancel.layer.cornerRadius = 17.5
        buttonCancel.layer.masksToBounds = true
        buttonCancel.tapped { [unowned self] in self.router.dismiss() }
        
        view.addConstraints([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonDismiss.topAnchor.constraint(equalTo: view.topAnchor),
            buttonDismiss.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonDismiss.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonDismiss.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            viewBox.heightAnchor.constraint(equalToConstant: height),
            constraintBottom,
            viewBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonArrow.widthAnchor.constraint(equalToConstant: 40),
            buttonArrow.heightAnchor.constraint(equalToConstant: 40),
            buttonArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonArrow.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 15),
            buttonArrow.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: viewBox.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: viewBox.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor),
            
            buttonCancel.trailingAnchor.constraint(equalTo: viewBox.trailingAnchor, constant: -20),
            buttonCancel.topAnchor.constraint(equalTo: viewBox.topAnchor, constant: 20),
            buttonCancel.heightAnchor.constraint(equalToConstant: 35),
            buttonCancel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.router.showing()
    }
}
