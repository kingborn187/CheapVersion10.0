//
//  TableViewCompanyController.swift
//  AppGT
//
//  Created by Renato Tramontano on 31/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit
//
class TableViewCompanyController: UITableViewController {
    
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
        return login.events()!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellCompanyTableView
        let bv = UIView()
        
        if let events = login.events() {
            cell.nameEvent.text = events[indexPath.row]
            cell.imageEvent.image = login.datiEvent(nameEvent: events[indexPath.row])?.immaginiSfida
            cell.deadlineEvent.text = login.datiEvent(nameEvent: events[indexPath.row])?.orario
            //cell.numPeopleEvent.text = login.datiEvent(nameEvent: events[indexPath.row])?.luogo
            bv.backgroundColor = UIColor(hue: 0, saturation: 0.46, brightness: 0.73, alpha: 1.0)
            cell.selectedBackgroundView = bv
        
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDettagli" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let events = login.events() {
                    let destinationController = segue.destination as! DetailsEventView
                    destinationController.imageViewText = (login.datiEvent(nameEvent: events[indexPath.row])?.immaginiSfida)!
                    destinationController.registerText = String(login.iscritti(nomeEvento: events[indexPath.row])!.count)
                    destinationController.deadlineText = (login.datiEvent(nameEvent: events[indexPath.row])?.data)!
                    destinationController.nameEvent = events[indexPath.row]
                }
            }
        }
    }
}
