//
//  event.swift
//  MCvsWILD
//
//  Created by Valentin Joly on 07/01/2021.
//

import Foundation
import UIKit

class Event {
    var path:  String = ""
    
    var title: String = ""
    var description: String = ""
    
    /*
    var choice1Title: String = ""
    var choice1Health: Int = 0
    var choice1Food: Int = 0
    var choice1Fear: Int = 0
    var choice1Sleep: Int = 0
    var choice1Time: Int = 0
    var choice1Loot: String = "NULL"
    var choice1Next: String = "NULL"
    
    var choice2Title: String = ""
    var choice2Health: Int = 0
    var choice2Food: Int = 0
    var choice2Fear: Int = 0
    var choice2Sleep: Int = 0
    var choice2Time: Int = 0
    var choice2Loot: String = "NULL"
    var choice2Next: String = "NULL"
    */
    
    var choice1 = Choice()
    var choice2 = Choice()
    
    
    init(pathEvent: String) {
        
        let lines = read(path: pathEvent)
        fillData(lines: lines)
        
    }
    
    func newEvent(choice: Choice) -> () {
        if (choice.getNext() != "NULL") {
            var nextPath = choice.getNext().split(separator: "/").last!
            nextPath = nextPath.split(separator: ".").first!
            let lines = read(path: String(nextPath))
            fillData(lines: lines)
                    
        }
        else {
            let numEvent = Int.random(in: 0...63)
            let lines = read(path: "event" + String(numEvent))
            fillData(lines: lines)
            
        }
    }
    
    func read(path: String) -> Array<Substring> {
        var text = ""
        if let data = NSDataAsset(name: path)?.data {
            text = String(data: data, encoding: .utf8)!
        }
        let lines = text.split(separator: "\n")
        
        return lines
    }
    
    func fillData(lines: Array<Substring>) {
        
        for item in lines {
            let separate = item.split(separator: ":")
            switch separate[0] {
            case "Titre":
                title = String(separate[1])
            case "Description_Event":
                description = String(separate[1])
                
                
            case "Choix1_Titre":
                choice1.setDescription(description: String(separate[1]))
            case "Choix1_Alimentatino":
                choice1.setFood(food: Int(separate[1])!)
            case "Choix1_Vie":
                choice1.setHealth(health: Int(separate[1])!)
            case "Choix1_Epuisement":
                choice1.setSleep(sleep: Int(separate[1])!)
            case "Choix1_Peur":
                choice1.setFear(fear: Int(separate[1])!)
            case "Choix1_Time":
                choice1.setTime(time: Int(separate[1])!)
            case "Choix1_Loot":
                choice1.setLoot(loot: String(separate[1]))
            case "Choix1_Next":
                choice1.setNext(next: String(separate[1]))
                
                
            case "Choix2_Titre":
                choice2.setDescription(description: String(separate[1]))
            case "Choix2_Alimentatino":
                choice2.setFood(food: Int(separate[1])!)
            case "Choix2_Vie":
                choice2.setHealth(health: Int(separate[1])!)
            case "Choix2_Epuisement":
                choice2.setSleep(sleep: Int(separate[1])!)
            case "Choix2_Peur":
                choice2.setFear(fear: Int(separate[1])!)
            case "Choix2_Time":
                choice2.setTime(time: Int(separate[1])!)
            case "Choix2_Loot":
                choice2.setLoot(loot: String(separate[1]))
            case "Choix2_Next":
                choice2.setNext(next: String(separate[1]))
                
            default:
                break
            }
        }
    }
    
    
    
    func getDescription() -> String {
        description
    }
    
    func getChoice1() -> Choice {
        choice1
    }
    func getChoice2() -> Choice {
        choice2
    }
    
}
