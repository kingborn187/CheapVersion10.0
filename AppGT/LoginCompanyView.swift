//
//  ViewCompanyController.swift
//  AppGT
//
//  Created by Renato Tramontano on 30/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginCompanyView: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameCompany: UITextField!
    @IBOutlet weak var buttonOk: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var sector: UITextField!
    @IBOutlet weak var iva: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet var imageCompany: UIButton!
    
    
    private var datiCompany = DatiCompany()
    var immagineAzienda: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameCompany.delegate = self
        password.delegate = self
        email.delegate = self
        sector.delegate = self
        iva.delegate = self
        city.delegate = self
        
        buttonOk.layer.borderWidth = 1.0
        buttonOk.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        buttonOk.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginCompanyView.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginCompanyView.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func insertPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func button_Ok(_ sender: UIButton) {
        let datiCompany = DatiCompany()
        
        datiCompany.insertDati(chiave: nameCompany.text!, password: password.text!, partitaIva: Int(iva.text!)!, inidirizzoAzienda: city.text!, tipoAzienda: sector.text!, numCouponTot: 0, numPersonTot: 0, imageCompany: immagineAzienda)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameCompany.resignFirstResponder()
        password.resignFirstResponder()
        email.resignFirstResponder()
        sector.resignFirstResponder()
        iva.resignFirstResponder()
        city.resignFirstResponder()
        return true
    }
}
