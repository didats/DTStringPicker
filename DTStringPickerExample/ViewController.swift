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

    @IBAction func clicked(_ sender: UIButton) {
        
        // specify the list of the string to choose
        let rows: [String] = [
            "Pilih Nomor satu",
            "Dia pilih dua",
            "Tiga-tiga sayang bunda juga",
            "Satu-dua-tiga sayang bunda aja",
            "Nomor lima gak ada duanya",
            "Kalau nomor 6, siapa yang suka",
            "Nomor tujuh, itu nomor saya",
            "Delapan, bulan Agustus",
            "Kalau Sembilan, bulan September",
            "Sepuluh, bulan Oktober",
        ]
        
        // create configuration
        let config = DTStringPickerConfig(color: UIColor.black, background: UIColor.white)
        
        // run the DTStringPicker
        DTStringPicker.show(with: config, rows: rows, done: { (selected, str) in
            sender.setTitle(str, for: .normal)
        }, cancel: {
            sender.setTitle("Cancelled", for: .normal)
        }, from: self)
        
    }
    
}

