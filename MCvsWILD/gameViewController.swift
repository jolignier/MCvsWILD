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
    @IBOutlet weak var choice2_description: UILabel!
    @IBOutlet weak var choice2_health: StatBar!
    @IBOutlet weak var choice2_food: StatBar!
    @IBOutlet weak var choice2_fear: StatBar!
    @IBOutlet weak var choice2_sleep: StatBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var main = Character()
        var current = Event(pathEvent: "eventScenario")
        changeViewEvent(current: current)
        player_name.text = main.getName()
        score.text = String(0)
        
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.clickOnChoice1(_:)))
        self.choice1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.clickOnChoice2(_:)))
        self.choice2.addGestureRecognizer(tap2)
    }
    
    

    @objc func clickOnChoice1(_ sender:UITapGestureRecognizer) {
        print("choice 1")
        changeViewEvent(current: Event(pathEvent: "event8"))
    }
    
    @objc func clickOnChoice2(_ sender:UITapGestureRecognizer) {
        print("choice 2")
    }
    
    func changeViewEvent(current: Event) {
        event_description.text = current.getDescription()
        
        choice1_description.text = current.getDescription1()
        choice2_description.text = current.getDescription2()
        
        choice1_health.setProgress(Float(current.choice1Health), animated: true)
        choice1_food.setProgress(Float(current.choice1Food), animated: true)
        choice1_fear.setProgress(Float(current.choice1Fear), animated: true)
        choice1_sleep.setProgress(Float(current.choice1Sleep), animated: true)
        
        choice2_health.setProgress(Float(current.choice2Health), animated: true)
        choice2_food.setProgress(Float(current.choice2Food), animated: true)
        choice2_fear.setProgress(Float(current.choice2Fear), animated: true)
        choice2_sleep.setProgress(Float(current.choice2Sleep), animated: true)
        
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
