//
//  DatiUser.swift
//  AppGT
//
//  Created by Renato Tramontano on 30/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class DatiUser: NSObject {
    
    var dataUser: [String: (nome: String, cognome: String, password: String, sesso: String, data: String, scorePoints: Int, email: String, foto: String)]?
    
    // DA CAMBIARE
    override init() {
        dataUser = ["kingborn187":("Renato", "Tramontano", "ciao", "M", "08 Gen 1988", 1000, "kingborn187", "ren"),
                    "kissKiss":("Giovanni", "Esposito", "ciao", "M", "08 Fef 1988", 750, "assd", ""),
                    "Arturo19":("Arturo", "Tramontano", "ciao", "M", "09 Gen 1988", 1000, "assasa", "")]
    }
    
    init?(dati: [String : (String, String, String, String, String, Int, String, String)]) {
        dataUser = dati
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let dati = aDecoder.decodeObject() as! [String : (String, String, String, String, String, Int, String, foto: String)]
        self.init(dati: dati)
    }
    
    
    func insertDati(chiave: String, nome: String, cognome: String, password: String, sesso: Int, data: String, scorePoints: Int, email: String, foto: String) {
        let sex = (sesso == 0) ? "M" : "F"
        dataUser = [chiave: (nome, cognome, password, sex, data, scorePoints, email, foto)]
        print("Dati User inseriti: \(dataUser)")
    }
    
    
    func userResearch(user: String, password: String) -> Bool {
        if (dataUser?[user]) != nil {
            if dataUser?[user]?.password == password {
                return true
            }
        }
        return false
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(dataUser)
    }
    
    func getDatiUser(key: String) -> (nome: String, cognome: String, password: String, sesso: String, data: String, scorePoints: Int, email: String, foto: String)? {
        return dataUser?[key]
    }
}
