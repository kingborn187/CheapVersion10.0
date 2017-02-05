//
//  ViewController.swift
//  QRCodeReader
//
//  Created by Renato Tramontano on 04/02/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//
//
import UIKit

var dati = Dati()

var timer = Timer()
var hours = 24
var minutes = 60
var seconds = 60

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var countdown: UILabel!
    @IBOutlet var punti: UILabel!
    @IBOutlet var vita1: UIImageView!
    @IBOutlet var vita2: UIImageView!
    @IBOutlet var vita3: UIImageView!
    @IBOutlet var vita4: UIImageView!
    @IBOutlet var vita5: UIImageView!
    @IBOutlet weak var ImmSfondoVitePoint: UIImageView!
    @IBOutlet weak var ImmSfondoCountPos: UIImageView!
    
    var vitaPersa = false
    var sfidaIndovinata = false
    
    var nomeSfida = "Challenge Parthenope"
   

        override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
            ImmSfondoVitePoint.layer.cornerRadius = 15
            ImmSfondoVitePoint.layer.masksToBounds = true
            ImmSfondoVitePoint.layer.borderWidth = 2.0
            ImmSfondoVitePoint.layer.borderColor = UIColor(hue: 0.7222, saturation: 0, brightness: 1, alpha: 0.25).cgColor
            
            ImmSfondoCountPos.layer.cornerRadius = 15
            ImmSfondoCountPos.layer.masksToBounds = true
            ImmSfondoCountPos.layer.borderWidth = 2.0
            ImmSfondoCountPos.layer.borderColor = UIColor(hue: 0.7222, saturation: 0, brightness: 1, alpha: 0.25).cgColor
            
        punti.text = String(dati.getPunteggio())
        print("ciao sono apparso")
        // Do any additional setup after loading the view.
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
            
            if dati.gameover(nomeSfida: nomeSfida) {
                self.performSegue(withIdentifier: "noLife", sender: self)
            }
            
        for i in 0 ... 4 {
            switch i {
                case 0:
                    if dati.getSfide(nomeSfida: nomeSfida).vite[i] == true {
                        vita1.isHidden = true
                } else {
                        vita1.isHidden = false
                }
    
                case 1:
                    if dati.getSfide(nomeSfida: nomeSfida).vite[i] == true {
                        vita2.isHidden = true
                    } else {
                        vita2.isHidden = false
                    }
                
                case 2:
                    if dati.getSfide(nomeSfida: nomeSfida).vite[i] == true {
                        vita3.isHidden = true
                    } else {
                        vita3.isHidden = false
                }
                
                case 3:
                    if dati.getSfide(nomeSfida: nomeSfida).vite[i] == true {
                        vita4.isHidden = true
                    } else {
                        vita4.isHidden = false
                    }
                
                case 4:
                    if dati.getSfide(nomeSfida: nomeSfida).vite[i] == true {
                        vita5.isHidden = true
                    } else {
                        vita5.isHidden = false
                    }
            default: break
                
            }
        }
            
            if dati.gameover(nomeSfida: nomeSfida) {
                self.performSegue(withIdentifier: "noLife", sender: self)
            } else
                
                if dati.startPoint == dati.getNumSfide(nomeSfida: nomeSfida) {
                    self.performSegue(withIdentifier: "youWin", sender: self)
            } else

            if vitaPersa == true {
                let alertController = UIAlertController(title: "Scelta sbagliata", message: "Ti sono rimaste \(5-dati.numVitPerse) vite", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
                    self.vitaPersa = false
                }));
                let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
                imageView.image = UIImage(named: "smile")
                alertController.view.addSubview(imageView)
                present(alertController, animated: true, completion: nil)
                
            } else
            
            if sfidaIndovinata == true {
                let alertController = UIAlertController(title: "Scelta giusta", message: "Continua cosi' dai!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
                    self.sfidaIndovinata = false
                }));
                let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
                imageView.image = UIImage(named: "smile2")
                alertController.view.addSubview(imageView)
                present(alertController, animated: true, completion: nil)
                
            }

            
            
    }

    func counter(){
        seconds -= 1
        self.countdown.text = String(hours).appending(" : ").appending(String(minutes)).appending(" : ").appending(String(seconds))
        
        if(seconds == 0){
            timer.invalidate()
            seconds = 60
            minutes -= 1
            self.countdown.text = String(hours).appending(" : ").appending(String(minutes)).appending(" : ").appending(String(seconds))
        }
        
        if(minutes == 0){
            timer.invalidate()
            minutes = 60
            hours -= 1
            self.countdown.text = String(hours).appending(" : ").appending(String(minutes)).appending(" : ").appending(String(seconds))
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        return dati.getNumSfide(nomeSfida: nomeSfida)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cella", for: indexPath as IndexPath) as! CollectionViewCell
        
        //impostiamo l'immagine e il testo della label con quelli precedentemente dichiarati nelle due variabili
        if dati.getSfide(nomeSfida: nomeSfida).trovata[indexPath.row] == true {
            cell.immagineSfida.setImage(UIImage(named: dati.getSfide(nomeSfida: nomeSfida).immagini[indexPath.row]), for: .normal)
            cell.isUserInteractionEnabled = true
            cell.scoreSfida.text = String(dati.getSfide(nomeSfida: nomeSfida).punteggio[indexPath.row])
            if dati.getSfide(nomeSfida: nomeSfida).indovinato[indexPath.row] == true {
                cell.spuntaOk.isHidden = false
                cell.isUserInteractionEnabled = false
            }
            else {
                cell.spuntaOk.isHidden = true
            }
        } else {
            cell.isUserInteractionEnabled = false
            cell.scoreSfida.text = String(dati.getSfide(nomeSfida: nomeSfida).punteggio[indexPath.row])
            cell.spuntaOk.isHidden = true
        }
        return cell
    }
    
    func collectionView(collection: UICollectionView, selectedItemIndex: NSIndexPath)
    {
        //As sender send any data you need from the current Selected CollectionView
        self.performSegue(withIdentifier: "showDettagli", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDettagli" {
            let cell = sender as! CollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            let destinationController = segue.destination as! DettagliViewController
            destinationController.imageSfidaImg = dati.getSfide(nomeSfida: nomeSfida).immagini[(indexPath?.row)!]
            destinationController.indizioTxt = dati.getSfide(nomeSfida: nomeSfida).indizii[(indexPath?.row)!]
        }
//        if segue.identifier == "showDettagli" {
//            let destinationController = segue.destination as! DettagliViewController
//            let cell = sender as! CollectionViewCell
//            let indexPath = collectionView.indexPath(for: cell)
//            destinationController.imageSfidaImg = dati.getSfide(nomeSfida: nomeSfida).immagini[(indexPath?.row)!]
//            destinationController.indizioTxt = dati.getSfide(nomeSfida: nomeSfida).indizii[(indexPath?.row)!]
//        } else if segue.identifier == "goHome" {
//            print("ciao")
//        }
    }

    

}
