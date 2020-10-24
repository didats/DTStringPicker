//
//  ViewController.swift
//  DTStringPickerExample
//
//  Created by Didats Triadi on 30/07/19.
//  Copyright © 2019 Rimbunesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func optionSectionClicked(_ sender: UIButton) {
        let rows: [DTStringPickerModelSection] = [
            DTStringPickerModelSection(title: "Header 1",
                                       items: [
                                        DTStringPickerModelItem(text: "Pilih satu dua"),
                                        DTStringPickerModelItem(text: "Ini nomor dua"),
                                        DTStringPickerModelItem(text: "Di sini nomor ketiga"),
                                       ]),
            DTStringPickerModelSection(title: "Second Header",
                                       items: [
                                        DTStringPickerModelItem(text: "Pilih satu dua"),
                                        DTStringPickerModelItem(text: "Ini nomor dua"),
                                        DTStringPickerModelItem(text: "Di sini nomor ketiga"),
                                       ]),
        ]
        
        // custom ui
        var config = DTStringPickerConfig(color: UIColor.black, background: UIColor.white)
        config.title = "Choose one option"
        config.alignment = .left
        config.itemFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        config.color = UIColor.black
        config.backgroundColor = UIColor.white
        config.shadowColor = UIColor.black
        config.titleFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        config.titleColor = UIColor.black
        config.sectionBackground = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        config.sectionFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        config.sectionColor = UIColor.black
        
        DTStringPicker.show(with: config, rowSections: rows, done: { item in
            print("Item: \(item)")
        }, cancel: {
            print("Cancel ===")
        }, from: self)
        
    }
    

    @IBAction func clicked(_ sender: UIButton) {
        // specify the list of the string to choose
        let rows = ["Number 1", "Another option 2", "The third choice", "4th item", "Other option", "Anything option"]
        
        // create configuration
        var config = DTStringPickerConfig(color: UIColor.black, background: UIColor.white)
        config.title = "Choose one option"
        config.alignment = .right
        
        DTStringPicker.show(with: config, rowItems: rows.map({ DTStringPickerModelItem(text: $0) }), done: { item in
            print("Item: \(item)")
        }, cancel: {
            print("Cancel ===")
        }, from: self)
    }
    
}

