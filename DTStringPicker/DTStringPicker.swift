//
//  DTStringPicker.swift
//  DTStringPicker
//
//  Created by Didats Triadi on 29/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

public struct DTStringPicker {
    
    private var pickerController: DTPickerViewController!
    
    public init(configuration: DTStringPickerConfig,
                rowItems: [DTStringPickerModelItem],
                alignment: DTStringPickerAlignment = .left,
                done: @escaping(_ item: DTStringPickerSelection) -> Void,
                cancel: @escaping() -> Void) {
        
        let pickerViewController = DTPickerViewController()
        let viewModel = DTPickerViewModel()
        viewModel.list = [DTStringPickerModelSection(title: "", items: rowItems)]
        viewModel.didClicked = { item in done(item) }
        
        pickerViewController.config = configuration
        pickerViewController.alignment = alignment
        pickerViewController.viewModel = viewModel
        pickerViewController.cancel = { cancel() }
        
        self.pickerController = pickerViewController
    }
    
    public init(configuration: DTStringPickerConfig,
                rowSections: [DTStringPickerModelSection],
                alignment: DTStringPickerAlignment = .left,
                done: @escaping(_ item: DTStringPickerSelection) -> Void,
                cancel: @escaping() -> Void) {
        
        let pickerViewController = DTPickerViewController()
        let viewModel = DTPickerViewModel()
        viewModel.list = rowSections
        viewModel.didClicked = { item in done(item) }
        
        pickerViewController.config = configuration
        pickerViewController.alignment = alignment
        pickerViewController.viewModel = viewModel
        pickerViewController.cancel = { cancel() }
        
        self.pickerController = pickerViewController
        
    }
    
    public static func show(with configuration: DTStringPickerConfig,
                            rowItems: [DTStringPickerModelItem],
                            done: @escaping(_ item: DTStringPickerSelection) -> Void,
                            cancel: @escaping() -> Void,
                            from viewController: UIViewController,
                            alignment: DTStringPickerAlignment = .left) {
        
        let picker = DTStringPicker(configuration: configuration, rowItems: rowItems, alignment: alignment, done: done, cancel: cancel)
        picker.show(from: viewController)
        
    }
    
    public static func show(with configuration: DTStringPickerConfig,
                            rowSections: [DTStringPickerModelSection],
                            done: @escaping(_ item: DTStringPickerSelection) -> Void,
                            cancel: @escaping() -> Void,
                            from viewController: UIViewController,
                            alignment: DTStringPickerAlignment = .left) {
        
        let picker = DTStringPicker(configuration: configuration, rowSections: rowSections, alignment: alignment, done: done, cancel: cancel)
        picker.show(from: viewController)
    }
    
    public func show(from viewController: UIViewController) {
        viewController.present(pickerController, animated: false, completion: nil)
    }
}

class PickerClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIButton {
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    func tapped( _ closure: @escaping ()->()) {
        let sleeve = PickerClosureSleeve(closure)
        addTarget(sleeve, action: #selector(PickerClosureSleeve.invoke), for: .touchUpInside)
        objc_setAssociatedObject(self, String(ObjectIdentifier(self).hashValue) + String(UIControl.Event.touchUpInside.rawValue), sleeve,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIApplication {
    static func delay(withTime: Double, callback: @escaping () -> Void) {
        let when = DispatchTime.now() + withTime
        DispatchQueue.main.asyncAfter(deadline: when) {
            callback()
        }
    }
    
    static func takeScreenshot(from: UIView) -> UIImage? {
        UIGraphicsBeginImageContext(from.bounds.size)
        from.drawHierarchy(in: from.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
}
