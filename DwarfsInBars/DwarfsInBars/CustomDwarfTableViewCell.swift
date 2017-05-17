//
//  CustomDwarfTableViewCell.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 17/05/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class CustomDwarfTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dwarfNameLabel: UILabel!
    @IBOutlet weak var ethyicprogressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
