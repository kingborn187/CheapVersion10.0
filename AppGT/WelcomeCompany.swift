//
//  WelcomeCompany.swift
//  AppGT
//
//  Created by Renato Tramontano on 04/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class WelcomeCompany: UIViewController {
    
    @IBOutlet weak var simpleProgress: UIProgressView!
    @IBOutlet weak var name: UILabel!
    //@IBOutlet var imgProfilo: UIImageView!
    @IBOutlet var imgProfilo: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        name.text = login.getKey()
        
        imgProfilo.image = UIImage(named: login.datiProfiloCompany().imageCompany)
        
        imgProfilo.layer.cornerRadius = self.imgProfilo.frame.size.width / 2
        imgProfilo.clipsToBounds = true
        
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            
            self.simpleProgress.setProgress(0.5, animated: true)
            self.simpleProgress.setProgress(1.0, animated: true)
            
        }
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert() {
        performSegue(withIdentifier: "company", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
