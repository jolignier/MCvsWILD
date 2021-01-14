//
//  inventoryTableViewCell.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 14/01/2021.
//

import UIKit

class inventoryTableViewCell: UITableViewCell {

    @IBOutlet weak var loot_pic: UIImageView!
    @IBOutlet weak var loot_name: UILabel!
    
    @IBOutlet weak var loot_health: UIProgressView!
    @IBOutlet weak var loot_food: UIProgressView!
    @IBOutlet weak var loot_fear: UIProgressView!
    @IBOutlet weak var loot_sleep: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
