//
//  Login.swift
//  AppGT
//
//  Created by Renato Tramontano on 01/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import Foundation
import UIKit


class Login {
    
    private var datiUser = DatiUser()
    private var datiCompany = DatiCompany()
    private var datiEvent = DatiEvento()
    
    private var key: String
    
    init() {
        key = ""
    }
    
    func login(user: String, password: String) -> String? {
        if datiUser.userResearch(user: user, password: password) {
            key = user
            return "showUser"
        }
        else if datiCompany.companyResearch(user: user, password: password) {
            key = user
            return "showCompany"
        }
        return nil
    }
    
    func events() -> [String]? {
        return datiEvent.getEvento(key: key)
    }
    
    func datiEvent(nameEvent: String) -> (luogo: String, data: String, orario: String, durata: Int, numeroMinPartecipanti: Int, numeroMaxPartecipanti: Int, immaginiSfida: UIImage, premio: String, sfida: String)? {
        return datiEvent.getDatiEvento(nomeEvento: nameEvent)
    }
    
    func iscritti(nomeEvento: String) -> [String]? {
        return datiEvent.getIscritti(nomeEvento: nomeEvento)
    }
    
    func datiProfiloCompany() -> (password: String, partitaIva: Int, inidirizzoAzienda: String, tipoAzienda: String, numCouponTot: Int, numPersonTot: Int, imageCompany: String) {
        return datiCompany.getDatiCompany(key: key)
    }
    
    func getKey() -> String {
        return key
    }
    
    func allEvents() -> [String: (luogo: String, data: String, orario: String, durata: Int, numeroMinPartecipanti: Int, numeroMaxPartecipanti: Int, immaginiSfida: UIImage, premio: String, sfida: String)]! {
        return datiEvent.getAllEvents()
    }
    
    func allKeysEvents() -> [String]? {
        return datiEvent.getChiaviEvento()
    }
    
    func datiProfiloUser() -> (nome: String, cognome: String, password: String, sesso: String, data: String, scorePoints: Int, email: String, foto: String)? {
        return datiUser.getDatiUser(key: key)
    }
    
    func myEvent() -> [String]?  {
        return datiEvent.getDatiMyEvent(key: key)
    }
    
    func eventNotRegistetred() -> [String]? {
        return datiEvent.getChiaviNotRegstred(key: key)
    }
    
    func iscrivitiAdEvento(nameEvent: String) {
        datiEvent.iscriviti(key: key, nameEvent: nameEvent)
    }
}
