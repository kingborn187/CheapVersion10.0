//
//  GameWinView.swift
//  AppGT
//
//  Created by Renato Tramontano on 06/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class GameWinView: UIViewController {
    
    @IBOutlet var position: UILabel!
    @IBOutlet var point: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        position.text = "First position"
        point.text = String(dati.getPunteggio())
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
