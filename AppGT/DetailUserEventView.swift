//
//  DetailUserEventView.swift
//  AppGT
//
//  Created by Renato Tramontano on 02/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation
import AddressBookUI

class DetailUserEventView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var dataEvent: UILabel!
    @IBOutlet weak var tipoEvent: UILabel!
    @IBOutlet weak var premioEvent: UILabel!
    @IBOutlet weak var mapEvent: MKMapView!
    @IBOutlet weak var confirmButton: UIButton!
    
    var imageIMG = UIImage()
    var nameTxt = ""
    var dataTxt = ""
    var tipoTxt = ""
    var premioTxt = ""
    
    var luogo = ""
    var titoloMarker = ""
    var descrizioneMarker = ""
    
    var locationManger: CLLocationManager!
    var userPosition: CLLocationCoordinate2D!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageEvent.image = imageIMG
        nameEvent.text = nameTxt
        dataEvent.text = dataTxt
        tipoEvent.text = tipoTxt
        premioEvent.text = premioTxt
        //
        confirmButton.layer.borderWidth = 1.0
        confirmButton.layer.borderColor = UIColor(white: 1.0, alpha: 0.7).cgColor
        confirmButton.layer.cornerRadius = 10
        
        self.locationManger = CLLocationManager()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.userPosition = userLocation.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: userPosition, span: span)
        mapView.setRegion(region, animated: true)
        
        var placemark: CLPlacemark!
        
        CLGeocoder().geocodeAddressString(self.luogo, completionHandler: {(placemarks, error)->Void in
            if error == nil {
                placemark = placemarks![0]
                self.mapEvent.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake (placemark.location!.coordinate.latitude, placemark.location!.coordinate.longitude), MKCoordinateSpanMake(0.002, 0.002)), animated: true)
        
                let puntoCercato = MKPointAnnotation()
                puntoCercato.coordinate = placemark.location!.coordinate
                puntoCercato.title = self.titoloMarker
                puntoCercato.subtitle = self.descrizioneMarker
                self.mapEvent.addAnnotation(puntoCercato)
            }
        })
    }
    

    @IBAction func confermEvent(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sei sicuro di volerti iscrivere", message: "Seleziona una delle due opzioni", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler:  {(action:UIAlertAction) in
            print("cancel")
        }));
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:  {(action:UIAlertAction) in
            login.iscrivitiAdEvento(nameEvent: self.nameEvent.text!)
        }));
   
        present(alertController, animated: true, completion: nil)
    }
    
  

}
