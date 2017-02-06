//
//  DetailsEventView.swift
//  AppGT
//
//  Created by Renato Tramontano on 01/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class DetailsEventView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var register: UILabel!
    @IBOutlet weak var sendEmail: UIButton!
    @IBOutlet weak var deadline: UILabel!

    
    var imageViewText = UIImage()
    var registerText = ""
    var deadlineText = ""
    var nameEvent = ""
    
     private let datiUser = DatiUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageEvent.image = imageViewText
        register.text = registerText
        deadline.text = deadlineText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (login.iscritti(nomeEvento: nameEvent)?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellEmail"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellEmailTableView
                
        cell.email.text = login.iscritti(nomeEvento: nameEvent)?[indexPath.row]
    

        return cell
    }

   
    
}
