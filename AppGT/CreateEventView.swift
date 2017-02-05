//
//  ViewCreateEventControllerViewController.swift
//  AppGT
//
//  Created by Renato Tramontano on 31/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class CreateEventView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var insertImage: UIImageView!
    @IBOutlet weak var insertCoupon: UIButton!
    @IBOutlet weak var selectChallenge: UIButton!
    @IBOutlet weak var nomeEvento: UITextField!
    @IBOutlet weak var luogo: UITextField!
    @IBOutlet weak var data: UITextField!
    @IBOutlet weak var ora: UITextField!
    @IBOutlet weak var durata: UITextField!
    @IBOutlet weak var numeroMaxPartecipanti: UITextField!
    @IBOutlet weak var numeroMinPartecipanti: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var premio: UITextField!
    
    var sfida:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nomeEvento.delegate = self
        luogo.delegate = self
        data.delegate = self
        ora.delegate = self
        durata.delegate = self
        numeroMaxPartecipanti.delegate = self
        numeroMinPartecipanti.delegate = self
        premio.delegate = self
        
        insertCoupon?.layer.borderWidth = 1.0
        insertCoupon?.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        insertCoupon?.layer.cornerRadius = 10
        
        selectChallenge?.layer.borderWidth = 1.0
        selectChallenge?.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        selectChallenge?.layer.cornerRadius = 10
        
        createButton?.layer.borderWidth = 1.0
        createButton?.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        createButton?.layer.cornerRadius = 10
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func open(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

    
    
    @IBAction func button_Ok(_ sender: UIButton) {
        let datiEvent = DatiEvento()
        
        datiEvent.insertDati(chiave: nomeEvento.text!, luogo: luogo.text!, data: data.text!, orario: ora.text!, durata: Int(durata.text!)!, numeroMinPartecipanti: Int(numeroMinPartecipanti.text!)!, numeroMaxPartecipanti: Int(numeroMaxPartecipanti.text!)!, immaginiSfida: insertImage.image!, premio: premio.text!, sfida: sfida)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nomeEvento.resignFirstResponder()
        luogo.resignFirstResponder()
        data.resignFirstResponder()
        durata.resignFirstResponder()
        ora.resignFirstResponder()
        durata.resignFirstResponder()
        numeroMaxPartecipanti.resignFirstResponder()
        numeroMinPartecipanti.resignFirstResponder()
        premio.resignFirstResponder()
        return true
    }
    
    @IBAction func selectChallenge(_ sender: Any) {
    }
   
    @IBAction func addCoupon(_ sender: Any) {
    }
}
