//
//  InventoryViewController.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 13/01/2021.
//

import UIKit

class InventoryViewController: UIViewController {

    @IBOutlet weak var player_name: UILabel!
    @IBOutlet weak var player_score: UILabel!
    
    var main: Character?
    var current: Event?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let character = main {
            player_name.text = character.getName()
            player_score.text = String(character.getScore())
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameViewController {
            vc.main = main!
            vc.current = current!
            
        }
    }

}
