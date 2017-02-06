//
//  DatiEvento.swift
//  AppGT
//
//  Created by Renato Tramontano on 31/01/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import Foundation
import UIKit

class DatiEvento {

    var iscritti: [String: [String]]
    var eventi: [String: [String]]
    var datiEvento: [String: (luogo: String, data: String, orario: String, durata: Int, numeroMinPartecipanti: Int, numeroMaxPartecipanti: Int, immaginiSfida: UIImage, premio: String, sfida: String)]!
    var chiaviEvento: [String]

    
    // Da cambiare
    init(){
        self.datiEvento = ["Challenge Parthenope": ("Napoli Via Francesco Petrarca", "06 Feb 07", "08:00", 24, 10, 30, UIImage(named: "parthenopeEvent")!, "10% off at the Uni Cafe", "QR Hunting"),
                           "Challenge Sony": ("Viale colli aminei", "05 Feb 07", "10:30", 24, 10, 30, UIImage(named: "sony")!, "10% off on an iPhone 6", "QR Hunting"),
                           "Challenge Amazon": ("Via Santo 61", "06 Feb 07", "09:15", 24, 10, 30, UIImage(named: "amazon")!, "15% off on books", "QR Hunting")]
        
        self.iscritti = ["Challenge Parthenope": ["Ren", "Gennaro", "Vincenzo", "Giuseppe"],
                         "Challenge Sony": ["Fabio", "Gennaro"],
                         "Challenge Amazon": ["Ren", "Vincenzo"]]
        
        self.eventi = ["Parthenope": ["Challenge Parthenope"]]
        self.chiaviEvento = ["Challenge Parthenope", "Challenge Sony", "Challenge Amazon"]
    }
    
    func getTot() -> Int {
        return datiEvento.count
    }
    
    
    func insertDati(chiave: String, luogo: String, data: String, orario: String, durata: Int, numeroMinPartecipanti: Int, numeroMaxPartecipanti: Int, immaginiSfida: UIImage, premio: String, sfida: String) {
        
        datiEvento = [chiave: (luogo, data, orario, durata, numeroMinPartecipanti, numeroMaxPartecipanti, immaginiSfida, premio, sfida)]
        print("Dati evento inseriti: \(datiEvento)")
    }
    
    func getEvento(key: String) -> [String]? {
        return eventi[key]
    }
    
    func getDatiEvento(nomeEvento: String) -> (String, String, String, Int, Int, Int, UIImage, String, String)? {
        return datiEvento[nomeEvento]
    }
    
    func getIscritti(nomeEvento: String) -> [String]? {
        return iscritti[nomeEvento]
    }
    
    func getAllEvents() -> [String: (luogo: String, data: String, orario: String, durata: Int, numeroMinPartecipanti: Int, numeroMaxPartecipanti: Int, immaginiSfida: UIImage, premio: String, sfida: String)]? {
        return datiEvento
    }
    
    func getChiaviEvento() -> [String]? {
        return chiaviEvento
    }
    
    func getDatiMyEvent(key: String) -> [String]? {
        var dict: [String] = Array()
    
        for evento in self.iscritti {
            for nomePartecipante in evento.value {
                if nomePartecipante == key {
                    dict.append(evento.key)
                }
            }
        }
        return dict
    }
    
   func  getChiaviNotRegstred(key: String) -> [String]? {
        let registred = getDatiMyEvent(key: key)
        var notRegistred = self.datiEvento
        var nameKey: [String] = []
    
        for nome in registred! {
            if datiEvento[nome] != nil {
            notRegistred?.removeValue(forKey: nome)
            }
        }
        for tmp in notRegistred! {
            nameKey.append(tmp.key)
        }
    
        return nameKey
    }
    
    func iscriviti(key: String, nameEvent: String) {
        self.iscritti[nameEvent]?.append(key)
    }
    
}
