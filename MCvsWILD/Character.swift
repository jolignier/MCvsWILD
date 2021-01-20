//
//  Character.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 11/01/2021.
//

import Foundation
import UIKit


class Character {
    private let MAXSTAT: Int = 20
    
    private var name: String = ""
    private var score: Int = 0
    private var health: Int
    private var food: Int
    private var fear: Int
    private var sleep: Int
    private var maxItem: Int = 6
    private var inventory: Array<Loot> = []
    
    
    
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
    
    func myChoice(choice: Choice) {
        self.score += choice.getTime()
        self.health += choice.getHealth()
        
        if (health > MAXSTAT) {
            health = MAXSTAT
        }
                
        self.food += choice.getFood()
        self.fear += choice.getFear()
        self.sleep += choice.getSleep()
    }
    
    func useItem(index: Int) {
        
        let item = self.inventory[index]
        
        self.health += item.getHealth()
        
        if (health > MAXSTAT) {
            health = MAXSTAT
        }
        
        self.food += item.getFood()
        self.fear += item.getFear()
        self.sleep += item.getSleep()
        
        self.maxItem += item.getMoreSpace()
        
        self.inventory.remove(at: index)
    }
    
    func isDead() -> Death {
        
        var death: Death = Death.Alive
        
        if (health <= 0) {
            death = Death.L_Life
            
        } else if (fear > MAXSTAT) {
            death = Death.H_Fear
            
        } else if (fear <= 0) {
            death = Death.L_Fear
            
        } else if (food > MAXSTAT) {
            death = Death.H_Food
            
        } else if (food <= 0) {
            death = Death.L_Food
            
        } else if (sleep > MAXSTAT) {
            death = Death.H_Sleep
            
        } else if (sleep <= 0) {
            death = Death.L_Sleep
            
        }
        return death
    }
    
    func saveScore() {
        
        let bestScore = Score(context: AppDelegate.viewContext)
        bestScore.name = name
        bestScore.score = Int16(score)
        try? AppDelegate.viewContext.save()
        
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
    
    func addStuff(newStuff: Loot) -> Bool {
        var isNotFull = inventory.count <= maxItem
        if isNotFull {
            inventory.append(newStuff)
        }
        isNotFull = inventory.count >= maxItem
        return isNotFull
    }
    
    func getName() -> String {
        self.name
    }
    
    func getScore() -> Int {
        self.score
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
    func getMaxItem() -> Int {
        self.maxItem
    }
    func getCurrentItemCount() -> Int {
        self.inventory.count
    }
    
    func getItem(index: Int) -> Loot {
        return self.inventory[index]
        
    }
    
    
}
