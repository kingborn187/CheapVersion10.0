//
//  Dati_user.swift
//  AppGT
//
//  Created by Giuseppe Medina on 30/01/2017.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class User {
  
    private let nome:String!
    private let cognome:String!
    private let password:String!
    private let sesso:String!
    private let ref:FIRDatabaseReference!

    init(){
      self.nome = String("nome")
      self.cognome = String("cognome")
      self.password = String("password")
      self.sesso = String("sesso")
      self.ref = FIRDatabase.database().reference()
    }
    
    //Funzione per l'inserimento dei dati utenti del DB;
    func inserisci(u:String,n:String,c:String,p:String,s:Character){
        let diz = [self.nome : n ,self.cognome : c,self.password : p,self.sesso: s] as [String:Any]
        self.ref.child("UTENTE").child(u).setValue(diz)
    }
    
    
    func controllo(u:String,p:String){
        let diz[String:Any] = self.ref.child("UTENTE").child(u).observe(.value, with: {v in u}
    
}

}
