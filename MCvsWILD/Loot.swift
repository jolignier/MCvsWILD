//
//  Loot.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 11/01/2021.
//

import Foundation
import UIKit

class Loot {
    private var path: String = ""
    private var title: String = ""
    private var health: Int = 0
    private var food: Int = 0
    private var fear: Int = 0
    private var sleep: Int = 0
    private var addBagSpace: Int = 0
    private var pathImg: String = "Default.png"
    
    init(lootPath: String) {
        var text = ""
        if let data = NSDataAsset(name: lootPath)?.data {
            text = String(data: data, encoding: .utf8)!
        }
        let lines = text.split(separator: "\n")
        
        
        
        for item in lines {
            let separate = item.split(separator: ":")
            switch separate[0] {
                case "Nom_Item":
                    title = String(separate[1])
                    
                case "Val_Item_Vie":
                    health = Int(separate[1])!
                case "Val_Item_Alimentation":
                    food = Int(separate[1])!
                case "Val_Item_Peur":
                    fear = Int(separate[1])!
                case "Val_Item_Epuisement":
                    sleep = Int(separate[1])!
                case "Add_Stuff":
                    addBagSpace = Int(separate[1])!
                case "pathImage":
                    pathImg = String(separate[1])
                
                default:
                    break
            }
        }
    }
    
    func getTitle() -> String {
        self.title
    }
    func getHealth() -> Int {
        self.health
    }
    func getFood() -> Int {
        self.food
    }
    func getFear() -> Int {
        self.fear
    }
    func getSleep() -> Int {
        self.sleep
    }
    
    func getImgPath() -> String {
        String(self.pathImg.split(separator: ".").first!)
    }
}
