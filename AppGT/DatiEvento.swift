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
        self.datiEvento = ["Challenge Partenope": ("Napoli Via Francesco Petrarca", "12 Gen 07", "19:19", 24, 10, 30, UIImage(named: "parthenope")!, "10% di sconto al bar", "Image Recongnition"),
                           "Challenge Sony": ("Via Giovanni 61", "04 Feb 07", "19:19", 24, 10, 30, UIImage(named: "sony")!, "10% di sconto sull'iphone 6", "Image Recongnition"),
                           "Challenge Amazon": ("Via Santo 61", "13 Feb 07", "19:19", 24, 10, 30, UIImage(named: "amazon")!, "15% di sconto sui libri", "Image Recongnition")]
        
        self.iscritti = ["Challenge Partenope": ["kingborn187", "kissKiss", "Arturo19"],
                         "Challenge Sony": ["kingborn187", "kissKiss"],
                         "Challenge Amazon": ["kingborn187"]]
        
        self.eventi = ["Parthenope": ["Challenge Partenope"]]
        self.chiaviEvento = ["Challenge Partenope", "Challenge Sony", "Challenge Amazon"]
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
