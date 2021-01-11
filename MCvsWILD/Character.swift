//
//  Character.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 11/01/2021.
//

import Foundation
import UIKit


class Character {
    let MAXSTAT: Int = 20
    
    var name: String = ""
    var score: Int = 0
    var health: Int
    var food: Int
    var fear: Int
    var sleep: Int
    var maxItem: Int = 6
    var inventory: Array<Loot> = []
    
    
    
    init() {
        var text = ""
        if let data = NSDataAsset(name: "ndm")?.data {
            text = String(data: data, encoding: .utf8)!
        }
        let lines = text.split(separator: "\n")
        name = String(lines.randomElement()!)

        health = MAXSTAT / 2
        food = MAXSTAT / 2
        fear = MAXSTAT / 2
        sleep = MAXSTAT / 2
        
    }
    
    func addHealth(toAdd: Int) {
        if (toAdd + self.health > MAXSTAT) {
            self.health = MAXSTAT
        }
        else if (toAdd + health < 0) {
            self.health = 0
        }
        else {
            self.health += toAdd
        }
        
    }
    func addFood(toAdd: Int) {
        if (toAdd + self.food > MAXSTAT) {
            self.food = MAXSTAT
        }
        else if (toAdd + self.food < 0) {
            self.food = 0
        }
        else {
            self.food += toAdd
        }
    }
    func addFear(toAdd: Int) {
        if (toAdd + self.fear > MAXSTAT) {
            self.fear = MAXSTAT
        }
        else if (toAdd + fear < 0) {
            self.fear = 0
        }
        else {
            self.fear += toAdd
        }
    }
    func addSleep(toAdd:Int) {
        if (toAdd + self.sleep > MAXSTAT) {
            self.sleep = MAXSTAT
        }
        else if (toAdd + sleep < 0) {
            self.sleep = 0
        }
        else {
            self.sleep += toAdd
        }
    }
    
    func getName() -> String {
        self.name
    }
    
}
