//
//  ViewController.swift
//  DNSecureTextField
//
//  Created by mainone on 16/10/20.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: DNSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchClick(_ sender: UISwitch) {
        self.passwordTextField.isSecureTextEntry = !sender.isOn
    }
    
    

}

