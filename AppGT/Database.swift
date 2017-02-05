//
//  Database.swift
//  AppGT
//
//  Created by Giuseppe Medina on 30/01/2017.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class Database{

    private let ref:FIRDatabaseReference!
    private var myDati = Dati()
    
    init() {
        self.ref = FIRDatabase.database().reference()
    }
    
    
    func insert(chiave: String, nome: String, cognome: String, password: String, sesso: Character, scorePoints: Int) {
        myDati = Dati(chiave: chiave, nome: nome, cognome: cognome, password: password, sesso: sesso, scorePoints: scorePoints)
    }
    
}
