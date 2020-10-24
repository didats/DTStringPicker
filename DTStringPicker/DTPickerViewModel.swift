//
//  DTPickerViewModel.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 22/10/20.
//  Copyright © 2020 Rimbunesia. All rights reserved.
//

import Foundation


class DTPickerViewModel {
    
    var didClicked: ((DTStringPickerSelection) -> Void)?
    var didSearch: (() -> Void)?
    
    var displayList: [DTStringPickerModelSection] = [] {
        didSet {
            self.didSearch?()
        }
    }
    
    var list: [DTStringPickerModelSection] = [] {
        didSet {
            self.displayList = list
        }
    }
    
    func search(text: String) {
        if text.isEmpty {
            displayList = list
        } else {
            
            displayList = list.map { (item) -> DTStringPickerModelSection in
                let newItems = item.items.filter { (strItem) -> Bool in
                    return (strItem.text.lowercased().contains(text.lowercased())) ? true : false
                }
                var newData = item
                newData.items = newItems
                
                return newData
            }
        }
    }
    
    func clicked(indexPath: IndexPath)  {
        let selected = displayList[indexPath.section].items[indexPath.row]
        let index = list[indexPath.section].items.firstIndex { (item) -> Bool in
            return item.text == selected.text
        }
        
        guard let indexItem = index else {
            return
        }
        
        let selectedData = DTStringPickerSelection(section: indexPath.section, row: indexItem, text: selected.text)
        self.didClicked?(selectedData)
    }
}
