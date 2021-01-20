//
//  gameViewController.swift
//  MCvsWILD
//
//  Created by “Jonathan Lignier” on 05/01/2021.
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
    
    func dying(death: Death) {
        
        if (death != Death.Alive) {
            
            var text = ""
            if let data = NSDataAsset(name: death.rawValue)?.data {
                text = String(data: data, encoding: .utf8)!
            }
            
            // Create AlertController
            let alert = AlertController(title: "Spoiler Alert t'es mort.e, tu as fait le mauvais choix !", message: text, preferredStyle: .alert)
            
            // Add actions
            let action = UIAlertAction(title: "oh sad 😢", style: .cancel, handler: {_ in
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "menuVC") as! ViewController
                self.present(newViewController, animated:true, completion:nil)
                
            })

            
            // Best score
            
            main.saveScore()
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    @objc func clickOnChoice1(_ sender:UITapGestureRecognizer) {
        main.myChoice(choice: current.getChoice1())
        dying(death: main.isDead())
        isLoot(choice: current.getChoice1())
        next(choice: current.getChoice1())
        
    }
    
    @objc func clickOnChoice2(_ sender:UITapGestureRecognizer) {
        main.myChoice(choice: current.getChoice2())
        dying(death: main.isDead())
        isLoot(choice: current.getChoice2())
        next(choice: current.getChoice2())
    }
    
    
    
    func isLoot(choice: Choice) {
        if (choice.getLoot() != "NULL") {
            
            var loot = choice.getLoot().split(separator: "/").last!
            loot = loot.split(separator: ".").first!
            
            let newLoot = Loot(lootPath: String(loot))
            
            
            if !main.addStuff(newStuff: newLoot) {
                // Create AlertController
                let alert = AlertController(title: "Trop lourd, tu repose l'objet et continu ton chemin ", message: "Ton inventaire est plein... Utilise un objet pour l'agrandir ", preferredStyle: .alert)
                alert.setTitleImage(UIImage(named: newLoot.getImgPath()))
                // Add actions
                let action = UIAlertAction(title: "😭", style: .cancel, handler: nil)
        
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
            else {
            
                // Create AlertController
                let alert = AlertController(title: "T'as trouvé ca ! Trop fort !", message: "Alors voyons voir... Oh ba dis tu as trouvé : " + newLoot.getTitle(), preferredStyle: .alert)
                alert.setTitleImage(UIImage(named: newLoot.getImgPath()))
                // Add actions
                let action = UIAlertAction(title: "Yay", style: .cancel, handler: nil)
        
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
 
        }
    }
    
    func next(choice: Choice) {
        current.newEvent(choice: choice)
        changeViewEvent(current: current) 
    }
    
    func changeViewEvent(current: Event) {
        
        score.text = String(main.getScore())
        player_health.setProgress(Float(main.getHealth())/20, animated: true)
        player_food.setProgress(Float(main.getFood())/20, animated: true)
        player_fear.setProgress(Float(main.getFear())/20, animated: true)
        player_sleep.setProgress(Float(main.getSleep())/20, animated: true)
        
        event_description.text = current.getDescription()
        
        choice1_description.text = current.getChoice1().getTitle()
        choice2_description.text = current.getChoice2().getTitle()
        
        choice1_health.setProgress(Float(abs(current.getChoice1().getHealth())) / 20, animated: true)
        choice1_food.setProgress(Float(abs(current.getChoice1().getFood())) / 20, animated: true)
        choice1_fear.setProgress(Float(abs(current.getChoice1().getFear())) / 20, animated: true)
        choice1_sleep.setProgress(Float(abs(current.getChoice1().getSleep())) / 20, animated: true)
        
        
        choice2_health.setProgress(Float(abs(current.getChoice2().getHealth())) / 20, animated: true)
        choice2_food.setProgress(Float(abs(current.getChoice2().getFood())) / 20, animated: true)
        choice2_fear.setProgress(Float(abs(current.getChoice2().getFear())) / 20, animated: true)
        choice2_sleep.setProgress(Float(abs(current.getChoice2().getSleep())) / 20, animated: true)
    }
    
    

    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? InventoryViewController {
            vc.main = main
            vc.current = current
        }
    }
    

}
