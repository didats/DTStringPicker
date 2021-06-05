//
//  DTStringPickerUI.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 23/10/20.
//  Copyright © 2020 Rimbunesia. All rights reserved.
//

import Foundation
import UIKit

struct PickerUI {
    private let tableView = UITableView(frame: CGRect.zero)
    private let dismissButton = UIButton(frame: CGRect.zero)
    private let boxView = DTPickerView(frame: CGRect.zero)
    private let searchBar = UISearchBar(frame: CGRect.zero)
    private let titleLabel = UILabel(frame: CGRect.zero)
    
    private var viewController: DTPickerViewController!
    private var config: DTStringPickerConfig!
    
    var bottomConstraint: NSLayoutConstraint!
    
    var tableViewDelegate: UITableViewDelegate? {
        didSet {
            self.tableView.delegate = tableViewDelegate
        }
    }
    
    var tableViewDataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = tableViewDataSource
        }
    }
    
    var searchbarDelegate: UISearchBarDelegate? {
        didSet {
            self.searchBar.delegate = searchbarDelegate
        }
    }
    
    init(from viewController: DTPickerViewController, config: DTStringPickerConfig) {
        self.viewController = viewController
        self.config = config
        self.viewController.view.frame = CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size)
        
        let views: [UIView] = [dismissButton, boxView, tableView, searchBar, titleLabel]
        var i = 0
        views.forEach { (item) in
            if item.superview == nil {
                if i > 1 {
                    boxView.addSubview(item)
                }
                else {
                    viewController.view.addSubview(item)
                }
            }
            item.translatesAutoresizingMaskIntoConstraints = false
            i += 1
        }
        
        bottomConstraint = boxView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: UIScreen.main.bounds.size.height)
    }
    
    func setup() {
        let view = viewController.view!
        boxView.backgroundColor = config.backgroundColor
        boxView.layer.shadowColor = config.shadowColor.cgColor
        
        view.backgroundColor = UIColor.clear
        
        searchBar.showsCancelButton = true
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.barStyle = .default
        searchBar.barTintColor = config.backgroundColor
        
        titleLabel.font = config.titleFont
        titleLabel.textColor = config.titleColor
        titleLabel.text = config.title
        titleLabel.textAlignment = config.alignment.convert()
        
        dismissButton.backgroundColor = UIColor.clear
        dismissButton.alpha = 0.4
        
        dismissButton.tapped { self.dismiss() }
        boxView.dismiss = { self.dismiss() }
        
        view.addConstraints([
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            boxView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height * 0.75),
            boxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -20),

            searchBar.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: -10),
            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            tableView.bottomAnchor.constraint(equalTo: boxView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: boxView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: boxView.trailingAnchor)
        ])
        bottomConstraint.isActive = true
    }
    
    func bottomConstraint(constant: CGFloat) {
        bottomConstraint.constant = constant
        UIView.animate(withDuration: 0.1) {
            self.viewController.view.layoutIfNeeded()
        }
    }
    
    func height() -> CGFloat {
        return UIScreen.main.bounds.size.height / 0.2
    }
    
    func dismiss() {
        
        bottomConstraint(constant: UIScreen.main.bounds.size.height)
        UIApplication.delay(withTime: 0.2) {
            self.viewController.dismiss(animated: false, completion: {
                self.viewController.cancel?()
            })
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func toggle(keyboardHidden: Bool) {
        bottomConstraint(constant: (keyboardHidden) ? 0 : -150)
    }
    
    func headerView(text: String) -> UIView {
        let view = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: tableView.frame.size.width, height: 40)))
        view.backgroundColor = config.sectionBackground
        
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 20, y: 0), size: CGSize(width: tableView.frame.size.width - 40, height: view.frame.size.height)))
        label.text = text
        label.font = config.sectionFont
        label.textColor = config.sectionColor
        label.textAlignment = config.alignment.convert()
        label.backgroundColor = config.sectionBackground
        
        view.addSubview(label)
        
        return view
    }
}

 
