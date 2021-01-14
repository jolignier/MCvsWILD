//
//  ViewController.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 05/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var play_btn: UIButton!
    @IBOutlet weak var best_score: UILabel!
    
    @IBAction func play_clk(_ sender: UIButton) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var text = ""
        if let data = NSDataAsset(name: "HighScore")?.data {
            text = String(data: data, encoding: .utf8)!
        }
        print(text)
        best_score.text = "Best Score : \n" + text
    }

}


