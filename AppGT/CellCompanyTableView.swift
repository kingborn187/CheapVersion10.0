//
//  CellCompanyTableView.swift
//  AppGT
//
//  Created by Renato Tramontano on 01/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class CellCompanyTableView: UITableViewCell {
    
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var numPeopleEvent: UILabel!
    @IBOutlet weak var deadlineEvent: UILabel!
    @IBOutlet weak var BackgroundCardView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageEvent.layer.cornerRadius = 10
        imageEvent.clipsToBounds = true
        BackgroundCardView.backgroundColor = UIColor(hue: 0, saturation: 0.82, brightness: 0.75, alpha: 0.45)
        contentView.backgroundColor = UIColor(hue: 0, saturation: 1, brightness: 0.66, alpha: 0.0)
        BackgroundCardView.layer.cornerRadius = 15
        BackgroundCardView.layer.masksToBounds = false
        BackgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        BackgroundCardView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        BackgroundCardView.layer.shadowOpacity = 0.9
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
