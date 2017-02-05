//
//  TableUserViewController.swift
//  AppGT
//
//  Created by Renato Tramontano on 02/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

import UIKit

class TableUserViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return login.eventNotRegistetred()!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellUser"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellUserTableViewTableViewCell
        let bv = UIView()
        
        if let events = login.eventNotRegistetred() {
            cell.imageEvent.image = login.datiEvent(nameEvent: events[indexPath.row])?.immaginiSfida
            cell.nameEvent.text = events[indexPath.row]
            cell.ricompensa.text = login.datiEvent(nameEvent: events[indexPath.row])?.premio
            cell.luogoEvent.text = login.datiEvent(nameEvent: events[indexPath.row])?.luogo
            bv.backgroundColor = UIColor(hue: 0.5583, saturation: 0.5, brightness: 0.81, alpha: 1.0)
            cell.selectedBackgroundView = bv
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailUser" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let events = login.eventNotRegistetred() {
                    let destinationController = segue.destination as! DetailUserEventView
                    destinationController.imageIMG = (login.datiEvent(nameEvent: events[indexPath.row])?.immaginiSfida)!
                    destinationController.nameTxt = events[indexPath.row]
                    destinationController.dataTxt = (login.datiEvent(nameEvent: events[indexPath.row])?.data)!
                    destinationController.tipoTxt = (login.datiEvent(nameEvent: events[indexPath.row])?.sfida)!
                    destinationController.premioTxt = (login.datiEvent(nameEvent: events[indexPath.row])?.premio)!
                        
                    destinationController.luogo = (login.datiEvent(nameEvent: events[indexPath.row])?.luogo)!
                    destinationController.titoloMarker = events[indexPath.row]
                    destinationController.descrizioneMarker = (login.datiEvent(nameEvent: events[indexPath.row])?.data)!
                }
            }
        }
    }
}
