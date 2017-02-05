//
//  DataCompany.swift
//  AppGT
//
//  Created by Giuseppe Medina on 30/01/2017.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import Foundation
import UIKit

class DatiCompany{
    
    private var datiAzienda: [String: (password: String, partitaIva: Int, inidirizzoAzienda: String, tipoAzienda: String, numCouponTot: Int, numPersonTot: Int, imageCompany: String)]
    
    
    // da cambiare
    init() {
        datiAzienda = ["Parthenope": ("ciao", 0123456, "via acton 87", "informatica", 0, 3, "parthenope"),
                       "Sony": ("ciao", 01234336, "viale Colli aminei ", "informatica", 1, 2, "sony"),
                       "Amazon": ("ciao", 01233456, "via Giovanni 87", "informatica", 0, 1, "amazon"),
                       "auchan": ("ciao", 01233456, "via Medina", "informatica", 0, 1, "auchan"),
                       "Carrefour": ("ciao", 01233456, "via Giovanni 87", "informatica", 0, 1, "carrefour")]
    }
    
    
    func insertDati(chiave: String, password: String, partitaIva: Int, inidirizzoAzienda: String, tipoAzienda: String, numCouponTot: Int, numPersonTot: Int, imageCompany: String) {
        datiAzienda = [chiave: (password, partitaIva, inidirizzoAzienda, tipoAzienda, numCouponTot, numPersonTot, imageCompany)]
        print("Dati azienda inseriti: \(datiAzienda)")
    }
    
    
    func companyResearch(user: String, password: String) -> Bool {
        if (datiAzienda[user]) != nil {
            if datiAzienda[user]?.password == password {
                return true
            }
        }
        return false
    }
    
    func getDatiCompany(key: String) -> (password: String, partitaIva: Int, inidirizzoAzienda: String, tipoAzienda: String, numCouponTot: Int, numPersonTot: Int, imageCompany: String) {
        return datiAzienda[key]!
    }
    
}
