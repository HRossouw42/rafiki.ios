//
//  OverviewTableViewCell.swift
//  rafiki.ios
//
//  Created by Harmun Rossouw on 2019/12/04.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var currencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
