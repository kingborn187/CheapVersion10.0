//
//  SettingViewController.swift
//  AppGT
//
//  Created by Renato Tramontano on 03/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disconnectButton.layer.borderWidth = 1.0
        disconnectButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        disconnectButton.layer.cornerRadius = 10
        
        infoButton.layer.borderWidth = 1.0
        infoButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        infoButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
