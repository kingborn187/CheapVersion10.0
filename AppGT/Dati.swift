//
//  Dati.swift
//  QRCodeReader
//
//  Created by Renato Tramontano on 04/02/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
import UIKit



class Dati {
    
    private var datiSfida: [String: (immagini: [String] , indizii: [String], difficolta: [Int], punteggio: [Int], trovata: [Bool], indovinato: [Bool], vite: [Bool])]
    
    var startPoint = 0
    var numVitPerse = 0
    var numSfide = 6
    var punteggio = 0
    
    init() {
        datiSfida = ["Challenge Parthenope":
            (["appartamento", "cucina", "bagno", "porto", "spiaggia", "parco"],
            ["Cerca vicino al letto1", "Cerca vicino al letto2", "Cerca vicino al letto3", "Cerca vicino al letto4", "Cerca vicino al letto5", "Cerca vicino al letto6"],
            [1, 2, 3, 4, 5, 6], [0, 0, 0, 0, 0, 0], [true, false, false, false, false, false], [false, false, false, false, false, false], [false, false, false, false, false])]
    }
    
    
    func startGame(nomeSfida: String) -> (immagine: String, indizio: String, difficolta: Int, punteggio: Int) {
        return (self.datiSfida[nomeSfida]!.immagini[0], (self.datiSfida[nomeSfida]?.indizii[0])!, self.datiSfida[nomeSfida]!.difficolta[0], self.datiSfida[nomeSfida]!.punteggio[0])
    }
    
    func statoAttuale(nomeSfida: String) ->
        (immagine: String, indizio: String, difficolta: Int, punteggio: Int) {
        return (self.datiSfida[nomeSfida]!.immagini[startPoint], (self.datiSfida[nomeSfida]?.indizii[startPoint])!, self.datiSfida[nomeSfida]!.difficolta[startPoint], self.datiSfida[nomeSfida]!.punteggio[startPoint])
    }
    
    func indizioSuccessivo() {
        startPoint += 1
    }
    
    func getNumSfide(nomeSfida: String) -> Int {
        return numSfide
    }
    
    func getSfide(nomeSfida: String) -> (immagini: [String] , indizii: [String], difficolta: [Int], punteggio: [Int], trovata: [Bool], indovinato: [Bool], vite: [Bool]) {
        return datiSfida[nomeSfida]!
    }
    
    func getPunteggio() -> Int {
        return punteggio
    }
    
    func verificaSfida(nomeSfida: String, nameImg: String) -> Bool {
        if datiSfida[nomeSfida]?.immagini[startPoint] == nameImg {
            print("qrcode n \(startPoint) trovata")
            datiSfida[nomeSfida]?.indovinato[startPoint] = true
            datiSfida[nomeSfida]?.punteggio[startPoint] = ((datiSfida[nomeSfida]?.punteggio[startPoint])!+1) * 10
            startPoint = startPoint + 1
            datiSfida[nomeSfida]?.trovata[startPoint] = true
            return true
        }
        else {
            print("vita persa")
            datiSfida[nomeSfida]?.vite[numVitPerse] = true
            numVitPerse = numVitPerse + 1
            return false
        }
    }
    
    func gameover(nomeSfida: String) -> Bool {
        let finito = true
        
        for vita in (datiSfida[nomeSfida]?.vite)! {
            print(vita)
            if vita == false {
                return false
            }
        }
        return finito
    }
}
