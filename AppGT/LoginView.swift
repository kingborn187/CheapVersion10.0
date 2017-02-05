//
//  ViewLogin.swift
//  AppGT
//
//  Created by Renato Tramontano on 30/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var companyButton: UIButton!
    @IBOutlet weak var uesrButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        companyButton.layer.borderWidth = 1.0
        companyButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        companyButton.layer.cornerRadius = 10
        
        uesrButton.layer.borderWidth = 1.0
        uesrButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        uesrButton.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
