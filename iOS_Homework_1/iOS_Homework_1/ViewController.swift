//
//  ViewController.swift
//  iOS_Homework_1
//
//  Created by David Marukhyan on 02.11.21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func buttonTapped(_ sender: Any) {
        if switchButton.isOn {
            label.text = String(Int.random(in: 11...100))
        } else {
            label.text = String(Int.random(in: 0...10))
        }
    }
    
    
    
}

