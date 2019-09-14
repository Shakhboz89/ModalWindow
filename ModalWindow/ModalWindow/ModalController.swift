//
//  ModalController.swift
//  ModalWindow
//
//  Created by MacBook on 9/14/19.
//  Copyright © 2019 Shakhboz. All rights reserved.
//

import UIKit

class ModalController: UIViewController {

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var nextBtn: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        print("Button pressed...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
