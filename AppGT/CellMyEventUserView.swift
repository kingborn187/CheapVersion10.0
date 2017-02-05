//
//  CellMyEventUserView.swift
//  AppGT
//
//  Created by Renato Tramontano on 03/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation
import AddressBookUI

class CellMyEventUserView: UITableViewCell {

    
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var dataEvent: UILabel!
    @IBOutlet weak var ricompensa: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var BackgroundCardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        startButton.layer.borderWidth = 1.0
        startButton.layer.borderColor = UIColor(white: 6.0, alpha: 0.6).cgColor
        startButton.layer.cornerRadius = 10
        
        BackgroundCardView.backgroundColor = UIColor(hue: 0.6056, saturation: 0.65, brightness: 0.83, alpha: 0.45)
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 0.0)
        BackgroundCardView.layer.cornerRadius = 15.0
        BackgroundCardView.layer.masksToBounds = false
        BackgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        BackgroundCardView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        BackgroundCardView.layer.shadowOpacity = 0.9
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
