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
    @IBOutlet weak var player_health: UIProgressView!
    @IBOutlet weak var player_food: UIProgressView!
    @IBOutlet weak var player_fear: UIProgressView!
    @IBOutlet weak var player_sleep: UIProgressView!
    
    
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
    
    var main = Character()
    var current = Event(pathEvent: "eventScenario")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
        main.myChoice(choice: current.getChoice1())
        current.newEvent()
        changeViewEvent(current: current)
        
    }
    
    @objc func clickOnChoice2(_ sender:UITapGestureRecognizer) {
        print("choice 2")
        main.myChoice(choice: current.getChoice2())
        current.newEvent()
        changeViewEvent(current: current)
        
    }
    
    
    func changeViewEvent(current: Event) {
        
        score.text = String(main.score)
        player_health.setProgress(Float(main.health)/20, animated: true)
        player_food.setProgress(Float(main.food)/20, animated: true)
        player_fear.setProgress(Float(main.fear)/20, animated: true)
        player_sleep.setProgress(Float(main.sleep)/20, animated: true)
        
        event_description.text = current.getDescription()
        
        choice1_description.text = current.getChoice1().getTitle()
        choice2_description.text = current.getChoice2().getTitle()
        
        choice1_health.setProgress(Float(abs(current.getChoice1().getHealth()))/10, animated: true)
        choice1_food.setProgress(Float(abs(current.getChoice1().getFood()))/10, animated: true)
        choice1_fear.setProgress(Float(abs(current.getChoice1().getFear()))/10, animated: true)
        choice1_sleep.setProgress(Float(abs(current.getChoice1().getSleep()))/10, animated: true)
        
        
        choice2_health.setProgress(Float(abs(current.getChoice2().getHealth()))/10, animated: true)
        choice2_food.setProgress(Float(abs(current.getChoice2().getFood()))/10, animated: true)
        choice2_fear.setProgress(Float(abs(current.getChoice2().getFear()))/10, animated: true)
        choice2_sleep.setProgress(Float(abs(current.getChoice2().getSleep()))/10, animated: true)
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
