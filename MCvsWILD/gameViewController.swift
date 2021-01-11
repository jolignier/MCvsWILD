//
//  gameViewController.swift
//  MCvsWILD
//
//  Created by “ios” on 05/01/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var event_description: UILabel!
    
    @IBOutlet weak var player_name: UILabel!
    @IBOutlet weak var choice1_description: UILabel!
    @IBOutlet weak var choice1_health: StatBar!
    @IBOutlet weak var choice1_food: StatBar!
    @IBOutlet weak var choice1_fear: StatBar!
    @IBOutlet weak var choice1_sleep: StatBar!
    
    @IBOutlet weak var choice1: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let main = Character()
        player_name.text = main.getName()
        print(main.getName())
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
