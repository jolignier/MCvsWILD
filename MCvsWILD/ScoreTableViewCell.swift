//
//  ScoreTableViewCell.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 20/01/2021.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var player_name: UILabel!
    @IBOutlet weak var player_score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
