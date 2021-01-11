//
//  gameViewController.swift
//  MCvsWILD
//
//  Created by “ios” on 05/01/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameView: UIView!
    
    
    @IBOutlet weak var event_description: UILabel!
    

    @IBOutlet weak var player_name: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var choice1: UIStackView!
    @IBOutlet weak var choice1_description: UILabel!
    @IBOutlet weak var choice1_health: StatBar!
    @IBOutlet weak var choice1_food: StatBar!
    @IBOutlet weak var choice1_fear: StatBar!
    @IBOutlet weak var choice1_sleep: StatBar!
    
    
    @IBOutlet weak var choice2: UIStackView!
    @IBOutlet weak var choice2_health: StatBar!
    @IBOutlet weak var choice2_food: StatBar!
    @IBOutlet weak var choice2_fear: StatBar!
    @IBOutlet weak var choice2_sleep: StatBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var main = Character()
        var current = Event(pathEvent: "eventScenario")
        
        player_name.text = main.getName()
        score.text = String(0)
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.clickOnChoice1(_:)))
        self.choice1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.clickOnChoice2(_:)))
        self.choice2.addGestureRecognizer(tap2)
    }
    
    

    @objc func clickOnChoice1(_ sender:UITapGestureRecognizer) {
        print("choice 1")
        
    }
    
    @objc func clickOnChoice2(_ sender:UITapGestureRecognizer) {
        print("choice 2")
    }
    
    func changeEvent(current: Event) {
        
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
