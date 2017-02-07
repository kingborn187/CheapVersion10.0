//
//  ViewUserController.swift
//  AppGT
//
//  Created by Giuseppe Medina on 30/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginUserView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameUser: UITextField?
    @IBOutlet weak var buttonOk: UIButton?
    @IBOutlet weak var password: UITextField?
    @IBOutlet weak var email: UITextField?
    @IBOutlet weak var surname: UITextField?
    @IBOutlet weak var date: UITextField?
    @IBOutlet weak var name: UITextField?
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet var imageUser: UIButton!
    @IBOutlet var labelAdd: UILabel!
    @IBOutlet var imageReal: UIImageView!
    
    private var datePickerView:UIDatePicker = UIDatePicker()
    private let datiUser = DatiUser()
    let picker = UIImagePickerController()
    
    var fotoProfilo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        // Do any additional setup after loading the view.
        nameUser?.delegate = self
        password?.delegate = self
        email?.delegate = self
        surname?.delegate = self
        name?.delegate = self
        date?.addTarget(self, action: #selector(selectDate), for: UIControlEvents.touchDown)
        sex?.addTarget(self, action: #selector(textFieldActive), for: UIControlEvents.touchDown)
        
        buttonOk?.layer.borderWidth = 1.0
        buttonOk?.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        buttonOk?.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    @IBAction func photoFromLibrary(_ sender: UIButton)
    {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imageReal.contentMode = .scaleAspectFit //3
        imageReal.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
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
    

    
    
    //Metodo che ci permette di inviare i valori di nameuser al database una volta premuto il bottone;
    @IBAction func button_Ok(_ sender: UIButton) {
        datiUser.insertDati(chiave: (nameUser?.text)!, nome: (name?.text)!, cognome: (surname?.text)!, password: (password?.text)!, sesso: sex.selectedSegmentIndex, data: (date?.text)!, scorePoints: 0, email: (email?.text)!, foto: fotoProfilo)
    }
    
    
    @IBAction func selectDate(_ sender: UITextField) {
        // Data Picker
        self.datePickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        datePickerView.backgroundColor = UIColor.white
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        // Tool Bar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.date?.inputAccessoryView = toolBar

        
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    
    func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        date?.text = dateFormatter1.string(from: datePickerView.date)
        self.date?.resignFirstResponder()
    }
    
    
    func cancelClick() {
        self.date?.resignFirstResponder()
    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        date?.text = dateFormatter.string(from: sender.date)
        
    }
    
    
    func textFieldActive(_ sender: UITextField) {
        let  tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216),style: .plain)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        sender.inputView = tableView

    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameUser?.resignFirstResponder()
        password?.resignFirstResponder()
        email?.resignFirstResponder()
        surname?.resignFirstResponder()
        name?.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

