//
//  DTStringPicker.swift
//  Bayar Woi
//
//  Created by Didats Triadi on 29/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

struct DTStringPicker {
    static func show(with configuration: DTStringPickerConfig, rows: [String], done: @escaping(_ selected: Int, _ str: String) -> Void, cancel: @escaping() -> Void, from viewController: UIViewController) {
        let picker = DTPickerRouter.openPicker(from: viewController, list: rows, config: configuration)
        picker.cancel = cancel
        picker.clicked = done
        
    }
}

struct DTStringPickerConfig {
    var cancelTitle: String
    var doneTile: String
    var itemFont: UIFont
    var doneFont: UIFont
    var cancelFont: UIFont
    var color: UIColor
    var backgroundColor: UIColor
    
    init() {
        cancelTitle = "Cancel"
        doneTile = "Done"
        itemFont = UIFont.systemFont(ofSize: 17, weight: .light)
        doneFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        cancelFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        color = UIColor(red: 221/255, green: 10/255, blue: 89/255, alpha: 1.0)
        backgroundColor = UIColor.white
        
    }
    
    init(cancel: String, font: UIFont, cancelFont: UIFont, color: UIColor, background: UIColor) {
        self.init()
        cancelTitle = cancel
        itemFont = font
        self.cancelFont = cancelFont
        self.color = color
        backgroundColor = background
    }
    
    init(cancel: String, font: UIFont, color: UIColor) {
        self.init()
        cancelTitle = cancel
        itemFont = font
        self.color = color
    }
}
