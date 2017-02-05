//
//  ProfiloUserView.swift
//  AppGT
//
//  Created by Renato Tramontano on 02/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class ProfiloUserView: UIViewController {
    @IBOutlet weak var punti: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var cognome: UILabel!
    @IBOutlet weak var citta: UILabel!
    @IBOutlet weak var eta: UILabel!
    @IBOutlet weak var sesso: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet var imgProfilo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        punti.text = String(describing: login.datiProfiloUser()?.scorePoints)
        nome.text = login.datiProfiloUser()?.nome
        cognome.text = login.datiProfiloUser()?.cognome
        citta.text = "UNKNOW"
        eta.text = login.datiProfiloUser()?.data
        sesso.text = login.datiProfiloUser()?.sesso
        email.text = login.datiProfiloUser()?.email
        imgProfilo.image = UIImage(named: (login.datiProfiloUser()?.foto)!)
        
        imgProfilo.layer.cornerRadius = self.imgProfilo.frame.size.width / 2
        imgProfilo.clipsToBounds = true
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
//
}
