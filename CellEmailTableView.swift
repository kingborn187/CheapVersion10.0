//
//  CellEmailTableView.swift
//  AppGT
//
//  Created by Renato Tramontano on 01/02/17.
//  Copyright © 2017 it.parthenope.iosdeveloper. All rights reserved.
//

import UIKit

class CellEmailTableView: UITableViewCell {
    

    @IBOutlet weak var email: UILabel!
    
    var emailText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        email.text = emailText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
