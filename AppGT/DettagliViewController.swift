//
//  DettagliViewController.swift
//  QRCodeReader
//
//  Created by Renato Tramontano on 04/02/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class DettagliViewController: UIViewController {

    @IBOutlet var imageSfida: UIImageView!
    @IBOutlet var indizio: UILabel!
    @IBOutlet var qrButton: UIButton!

    @IBOutlet weak var ImageSfondoIndizio: UIImageView!

    var imageSfidaImg = ""
    var indizioTxt = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSfida.image = UIImage(named: imageSfidaImg)
        indizio.text = indizioTxt
        // Do any additional setup after loading the view.
        
        imageSfida.layer.cornerRadius = 15
        imageSfida.layer.masksToBounds = true
        imageSfida.layer.borderWidth = 2.0
        imageSfida.layer.borderColor = UIColor(hue: 0.7222, saturation: 0, brightness: 1, alpha: 0.25).cgColor
        ImageSfondoIndizio.layer.cornerRadius = 15
        ImageSfondoIndizio.layer.masksToBounds = true
        ImageSfondoIndizio.layer.borderWidth = 2.0
        ImageSfondoIndizio.layer.borderColor = UIColor(hue: 0.7222, saturation: 0, brightness: 1, alpha: 0.25).cgColor
        
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
