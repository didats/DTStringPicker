//
//  PickerImageCell.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 01/07/20.
//  Copyright © 2020 Rimbunesia. All rights reserved.
//

import UIKit

class PickerImageCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
