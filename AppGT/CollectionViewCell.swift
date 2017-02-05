//
//  CollectionViewCell.swift
//  QRCodeReader
//
//  Created by Renato Tramontano on 04/02/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet var scoreSfida: UILabel!
    @IBOutlet var immagineSfida: UIButton!
    @IBOutlet var spuntaOk: UIImageView!
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        immagineSfida.layer.cornerRadius = 15
        immagineSfida.layer.masksToBounds = true
        immagineSfida.layer.borderWidth = 2.0
        immagineSfida.layer.borderColor = UIColor(hue: 0.7222, saturation: 0, brightness: 1, alpha: 0.25).cgColor
    }
    
   
    
}
