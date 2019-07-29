//
//  DTPickerCell.swift
//  Academy
//
//  Created by Didats Triadi on 18/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DTPickerCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func create(tableView: UITableView, indexPath: IndexPath, data: String, config: DTStringPickerConfig) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DTPickerCell")
        if cell == nil {
            cell = DTPickerCell(style: .default, reuseIdentifier: "DTPickerCell")
        }
        (cell as! DTPickerCell).setItem(data, config: config)
        
        return cell!
    }
    
    func setItem(_ str: String, config: DTStringPickerConfig) {
        textLabel?.textColor = config.color
        textLabel?.font = config.itemFont
        textLabel?.text = str
        
        backgroundColor = config.backgroundColor
        contentView.backgroundColor = config.backgroundColor
    }
    
}
