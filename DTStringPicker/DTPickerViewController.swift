//
//  DTPickerViewController.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 17/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerViewController: UIViewController {
    
    var viewModel: DTPickerViewModel!
    
    private var uiModel: PickerUI!
    
    var config: DTStringPickerConfig!
    var alignment: DTStringPickerAlignment!
    
    var cancel: (() -> Void)?
    
    override func loadView() {
        super.loadView()
        self.uiModel = PickerUI(from: self, config: self.config)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiModel.tableViewDelegate = self
        uiModel.tableViewDataSource = self
        uiModel.searchbarDelegate = self
        self.uiModel.setup()
        
        self.bindToViewModel()
    }
    
    private func bindToViewModel() {
        viewModel.didSearch = { [weak self] in
            self?.uiModel.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.delay(withTime: 0.2) {
            self.uiModel.bottomConstraint(constant: 0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
}

extension DTPickerViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(text: searchBar.text ?? "")
        searchBar.resignFirstResponder()
        uiModel.toggle(keyboardHidden: true)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        uiModel.toggle(keyboardHidden: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        uiModel.toggle(keyboardHidden: false)
    }
}

extension DTPickerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.clicked(indexPath: indexPath)
        uiModel.dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension DTPickerViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.displayList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return uiModel.headerView(text: viewModel.displayList[section].title)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let text = viewModel.displayList[section].title
        return text.isEmpty ? 0 : 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.displayList[section]
        return section.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.displayList[indexPath.section]
        return DTPickerCell.create(tableView: tableView, indexPath: indexPath, data: section.items[indexPath.row].text, config: config)
    }
}
