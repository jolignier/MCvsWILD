//
//  choice.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 11/01/2021.
//

import Foundation

class Choice {
    
    private var title: String
    private var health: Int
    private var food: Int
    private var fear: Int
    private var sleep: Int
    private var time: Int
    private var loot: String
    private var next: String
    
    init(title:String, health:Int, food:Int, fear:Int, sleep:Int, time:Int, loot:String, next:String) {
        
        self.title = title
        self.health = health
        self.food = food
        self.fear = fear
        self.sleep = sleep
        self.time = time
        self.loot = loot
        self.next = next
    }
    
    init() {
        title = ""
        health = 0
        food = 0
        fear = 0
        sleep = 0
        time = 0
        loot = "NULL"
        next = "NULL"
        
    }
    
    func setDescription(description:String) {
        self.title = description
    }
    func setHealth(health:Int) {
        self.health = health
    }
    func setFood(food:Int) {
        self.food = food
    }
    func setFear(fear:Int) {
        self.fear = fear
    }
    func setSleep(sleep:Int) {
        self.sleep = sleep
    }
    func setTime(time:Int) {
        self.time = time
    }
    func setLoot(loot:String) {
        self.loot = loot
    }
    func setNext(next:String) {
        self.next = next
    }
    
    func getTitle () -> String {
        self.title
    }
    func getLoot () -> String {
        self.loot
    }
    func getNext () -> String {
        self.next
    }
    func getHealth () -> Int {
        self.health
    }
    func getFood () -> Int {
        self.food
    }
    func getFear () -> Int {
        self.fear
    }
    func getSleep () -> Int {
        self.sleep
    }
    func getTime () -> Int {
        self.time
    }
}
