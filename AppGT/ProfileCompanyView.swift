//
//  ProfileCompanyView.swift
//  AppGT
//
//  Created by Renato Tramontano on 01/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class ProfileCompanyView: UIViewController {
    
    var datiCompany = DatiCompany()

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var luogo: UILabel!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var iva: UILabel!
    @IBOutlet weak var numEventi: UILabel!
    @IBOutlet weak var numPerson: UILabel!
    @IBOutlet weak var numCoupon: UILabel!
    @IBOutlet weak var ranking: UILabel!
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var Immaginesfondotrasp: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = login.getKey()
        luogo.text = login.datiProfiloCompany().inidirizzoAzienda
        tipo.text = login.datiProfiloCompany().tipoAzienda
        iva.text = String(login.datiProfiloCompany().partitaIva)
        numEventi.text = String(login.events()!.count)
        numPerson.text = String(login.datiProfiloCompany().numPersonTot)
        numCoupon.text = String(login.datiProfiloCompany().numCouponTot)
        imageEvent.image = UIImage(named: login.datiProfiloCompany().imageCompany)
        
        imageEvent.layer.masksToBounds = true
        imageEvent.layer.cornerRadius = 15
        imageEvent.layer.borderWidth = 0.0
        imageEvent.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        
        Immaginesfondotrasp.layer.cornerRadius = 15
        Immaginesfondotrasp.layer.masksToBounds = true
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
