//
//  DTStringPickerModel.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 23/10/20.
//  Copyright © 2020 Rimbunesia. All rights reserved.
//

import Foundation
import UIKit

public enum DTStringPickerAlignment {
    case left, right, center
}

extension DTStringPickerAlignment {
    func convert() -> NSTextAlignment {
        switch self {
        case .left:
            return .left
        case .right:
            return .right
        default:
            return .center
        }
    }
}

public struct DTStringPickerModelItem {
    public let text: String
}

public struct DTStringPickerModelSection {
    public let title: String
    public var items: [DTStringPickerModelItem]
}

public struct DTStringPickerSelection {
    public let section: Int
    public let row: Int
    public let text: String
}

public struct DTStringPickerConfig {
    var title: String
    var titleFont: UIFont
    var titleColor: UIColor
    var itemFont: UIFont
    var color: UIColor
    var backgroundColor: UIColor
    var shadowColor: UIColor
    var alignment: DTStringPickerAlignment
    var sectionBackground: UIColor
    var sectionFont: UIFont
    var sectionColor: UIColor
    
    public init() {
        itemFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        color = UIColor.black
        backgroundColor = UIColor.white
        shadowColor = UIColor.black
        title = NSLocalizedString("title", comment: "title")
        titleFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleColor = UIColor.black
        alignment = .left
        sectionBackground = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        sectionFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        sectionColor = UIColor.black
    }
    
    public init(color: UIColor, background: UIColor) {
        self.init()
        self.color = color
        backgroundColor = background
    }
    
    
}
