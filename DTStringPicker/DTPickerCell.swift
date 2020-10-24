//
//  DTPickerCell.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 18/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerCell: UITableViewCell {
    
    static let nibName = "DTPickerCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DTPickerCell.nibName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func create(tableView: UITableView, indexPath: IndexPath, data: String, config: DTStringPickerConfig) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: nibName)
        if cell == nil {
            cell = DTPickerCell(style: .default, reuseIdentifier: nibName)
        }
        (cell as! DTPickerCell).setItem(data, config: config)
        
        return cell!
    }
    
    func setItem(_ str: String, config: DTStringPickerConfig) {
        textLabel?.textColor = config.color
        textLabel?.font = config.itemFont
        textLabel?.text = str
        textLabel?.textAlignment = config.alignment.convert()
        
        backgroundColor = config.backgroundColor
        contentView.backgroundColor = config.backgroundColor
    }
}
