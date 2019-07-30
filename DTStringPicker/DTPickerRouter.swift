//
//  DTPickerRouter.swift
//  Academy
//
//  Created by Didats Triadi on 17/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class DTPickerRouter: NSObject  {
    var viewController: DTPickerViewController!
    var presenter = DTPickerPresenter()
    
    init(controller: DTPickerViewController) {
        super.init()
        viewController = controller
    }
    
    static func openPicker(from: UIViewController, list: [String], config: DTStringPickerConfig = DTStringPickerConfig()) -> DTPickerViewController {
        let picker = DTPickerViewController()
        picker.list = list
        picker.config = config
        picker.background = UIApplication.takeScreenshot(from: from.view)
        from.present(picker, animated: false, completion: nil)
        
        return picker
    }
    
    func dismiss() {
        viewController.cancel?()
        presenter.dismiss(constraint: viewController.constraintBottom, viewController: viewController)
    }
    
    func showing() {
        UIApplication.delay(withTime: 0.1) { [unowned self] in
            self.presenter.showing(constraint: self.viewController.constraintBottom, viewController: self.viewController)
        }
    }
    
    func height() -> CGFloat {
        var height = UIScreen.main.bounds.size.height / 1.5
        let dynamicHeight: CGFloat = CGFloat((70 * viewController.list.count) + 80)
        if dynamicHeight < height {
            height = dynamicHeight
        }
        
        return height
    }
}

extension DTPickerRouter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewController.clicked?(indexPath.row, viewController.list[indexPath.row])
        presenter.dismiss(constraint: viewController.constraintBottom, viewController: viewController)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension DTPickerRouter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DTPickerCell.create(tableView: tableView, indexPath: indexPath, data: viewController.list[indexPath.row], config: viewController.config)
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

private extension UIApplication {
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
