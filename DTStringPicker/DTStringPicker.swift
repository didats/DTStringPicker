//
//  DTStringPicker.swift
//  Bayar Woi
//
//  Created by Didats Triadi on 29/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

public struct DTStringPicker {
    public static func show(with configuration: DTStringPickerConfig, rows: [String], done: @escaping(_ selected: Int, _ str: String) -> Void, cancel: @escaping() -> Void, from viewController: UIViewController) {
        let picker = DTPickerRouter.openPicker(from: viewController, list: rows, config: configuration)
        picker.cancel = cancel
        picker.clicked = done
    }
    
    public static func show(rows: [String], done: @escaping(_ selected: Int, _ str: String) -> Void, cancel: @escaping() -> Void, from viewController: UIViewController) {
        show(with: DTStringPickerConfig(), rows: rows, done: done, cancel: cancel, from: viewController)
    }
}

public struct DTStringPickerConfig {
    var itemFont: UIFont
    var color: UIColor
    var backgroundColor: UIColor
    var shadowColor: UIColor
    
    init() {
        itemFont = UIFont.systemFont(ofSize: 17, weight: .light)
        color = UIColor(red: 221/255, green: 10/255, blue: 89/255, alpha: 1.0)
        backgroundColor = UIColor.white
        shadowColor = UIColor.black
    }
    
    init(color: UIColor, background: UIColor) {
        self.init()
        self.color = color
        backgroundColor = background
    }
}
