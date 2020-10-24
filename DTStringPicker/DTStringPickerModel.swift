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
    
    public init(text: String) {
        self.text = text
    }
}

public struct DTStringPickerModelSection {
    public let title: String
    public var items: [DTStringPickerModelItem]
    
    public init(title: String, items: [DTStringPickerModelItem]) {
        self.title = title
        self.items = items
    }
}

public struct DTStringPickerSelection {
    public let section: Int
    public let row: Int
    public let text: String
}

public struct DTStringPickerConfig {
    public var title: String
    public var titleFont: UIFont
    public var titleColor: UIColor
    public var itemFont: UIFont
    public var color: UIColor
    public var backgroundColor: UIColor
    public var shadowColor: UIColor
    public var alignment: DTStringPickerAlignment
    public var sectionBackground: UIColor
    public var sectionFont: UIFont
    public var sectionColor: UIColor
    
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
    
    public init(title: String,
                titleFont: UIFont,
                titleColor: UIColor,
                itemFont: UIFont,
                color: UIColor,
                backgroundColor: UIColor,
                shadowColor: UIColor,
                alignment: DTStringPickerAlignment,
                sectionBackground: UIColor,
                sectionFont: UIFont,
                sectionColor: UIColor) {
        self.title = title
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.itemFont = itemFont
        self.color = color
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.alignment = alignment
        self.sectionBackground = sectionBackground
        self.sectionFont = sectionFont
        self.sectionColor = sectionColor
    }
}
