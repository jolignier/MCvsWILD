//
//  ViewController.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 05/01/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var play_btn: UIButton!
    @IBOutlet weak var best_score: UILabel!
    
    @IBAction func play_clk(_ sender: UIButton) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let request: NSFetchRequest<Score> = Score.fetchRequest()
        guard var scores = try? AppDelegate.viewContext.fetch(request) else {
            return
        }
        
        if scores.isEmpty {
            best_score.text = "Pas encore de meilleur score"
        }
        else {
            
            scores.sort(by: {$0.score > $1.score})
            let bestScore = scores.first!
            
            best_score.text = "Meilleur score :" + String(bestScore.score) + "h"
            best_score.text! += "\n" + "realisé par : " + bestScore.name!
    
        }
    }
}


