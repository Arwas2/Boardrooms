//
//  ViewController.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 21/08/1444 AH.
//

import UIKit

class ViewController:

    UIViewController {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet var button : UIButton!
    @IBOutlet weak var field2: UITextField!
//    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        field.returnKeyType = .done
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.becomeFirstResponder()
    }
    
//    label.font = UIFont(name: "Inter-Regular", size: 36)
//
//    label.text = "Lorem ipsum dolor sit amet."
    
    
    @IBAction func buttonTapped() {
        // do stuff
        
        field.resignFirstResponder()
        
        
        
    }
    
}
