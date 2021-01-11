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
    
    
    init(pathEvent: String) {
        var text = ""
        if let data = NSDataAsset(name: pathEvent)?.data {
            text = String(data: data, encoding: .utf8)!
        }
        let lines = text.split(separator: "\n")
        fillData(lines: lines)
        
    }
    
    func newEvent() -> () {
        let numEvent = Int.random(in: 0...63)
        var text = ""
        if let data = NSDataAsset(name: "event" + String(numEvent))?.data {
            text = String(data: data, encoding: .utf8)!
        }
        let lines = text.split(separator: "\n")
        fillData(lines: lines)
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
                choice1Title = String(separate[1])
            case "Choix1_Alimentatino":
                choice1Food = Int(separate[1])!
            case "Choix1_Vie":
                choice1Health = Int(separate[1])!
            case "Choix1_Epuisement":
                choice1Sleep = Int(separate[1])!
            case "Choix1_Peur":
                choice1Fear = Int(separate[1])!
            case "Choix1_Time":
                choice1Time = Int(separate[1])!
            case "Choix1_Loot":
                choice1Loot = String(separate[1])
            case "Choix1_Next":
                choice1Next = String(separate[1])
                
                
            case "Choix2_Titre":
                choice2Title = String(separate[1])
            case "Choix2_Alimentatino":
                choice2Food = Int(separate[1])!
            case "Choix2_Vie":
                choice2Health = Int(separate[1])!
            case "Choix2_Epuisement":
                choice2Sleep = Int(separate[1])!
            case "Choix2_Peur":
                choice2Fear = Int(separate[1])!
            case "Choix2_Time":
                choice2Time = Int(separate[1])!
            case "Choix2_Loot":
                choice2Loot = String(separate[1])
            case "Choix2_Next":
                choice2Next = String(separate[1])
                
            default:
                break
            }
        }
    }
    
    func getDescription() -> String {
        description
    }
    
    func getHealth1() -> Int {
        choice1Health
    }
    func getFood1() -> Int {
        choice1Food
    }
    func getFear1() -> Int {
        choice1Fear
    }
    func getSleep1() -> Int {
        choice1Sleep
    }
    func getDescription1() -> String {
        choice1Title
    }
    func getDescription2() -> String {
        choice2Title
    }
    
}
