//
//  TableMYEventUserView.swift
//  AppGT
//
//  Created by Renato Tramontano on 03/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class TableMYEventUserView: UITableViewController {
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        print("apparsa")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (login.myEvent()?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellMyEvent"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellMyEventUserView
        let bv = UIView()
        if let events = login.myEvent() {
            
            cell.imageEvent.image = (login.datiEvent(nameEvent: events[indexPath.row])?.immaginiSfida)!
            cell.dataEvent.text = (login.datiEvent(nameEvent: events[indexPath.row])?.data)!
            cell.nameEvent.text = events[indexPath.row]
            cell.ricompensa.text = (login.datiEvent(nameEvent: events[indexPath.row])?.premio)!
            bv.backgroundColor = UIColor(hue: 0.5583, saturation: 0.5, brightness: 0.81, alpha: 1.0)
            cell.selectedBackgroundView = bv
            cell.imageEvent.layer.cornerRadius = 16
            cell.imageEvent.clipsToBounds = true
            
            if (cell.dataEvent.text?.contains("04 Feb 07"))! {
                cell.startButton.setTitleColor(.green, for: .normal)
                cell.startButton.isEnabled = true
            } else {
                cell.startButton.isEnabled = false
            }
        }
        return cell
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gameStart" {
//            print("cico")
//        }
//            let destinationController = segue.destination as! CellMyEventUserView
//            
//            if destinationController.location.contains("Via Giovanni 61") {
//                performSegue(withIdentifier: "gameStart", sender: self)
//            } else {
//                let alertController = UIAlertController(title: "Error", message: "the username or the password you entered was incorrect", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//                present(alertController, animated: true, completion: nil)
//            }
//        }
    
    
}
