//
//  Loot.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 11/01/2021.
//

import Foundation
import UIKit

class Loot {
    var path: String = ""
    var title: String = ""
    var health: Int = 0
    var food: Int = 0
    var fear: Int = 0
    var sleep: Int = 0
    var addBagSpace: Int = 0
    var pathImg: String = "Defalut.png"
    
    init(lootPath: String) {
        var text = ""
        if let data = NSDataAsset(name: lootPath)?.data {
            text = String(data: data, encoding: .utf8)!
            print(text)
        }
        let lines = text.split(separator: "\n")
        print(lines)
        
        
        
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
}
