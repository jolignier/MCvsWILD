//
//  InventoryViewController.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 13/01/2021.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var player_name: UILabel!
    @IBOutlet weak var player_score: UILabel!
    @IBOutlet weak var inventoryTableView: UITableView!
    
    
    
    var main: Character?
    var current: Event?
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main!.getCurrentItemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = inventoryTableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as! inventoryTableViewCell
        let row = indexPath.row
        let item = main!.getItem(index: row)
        cell.loot_name.text = item.getTitle()
        cell.loot_pic.image = UIImage(named: item.getImgPath())
        
        cell.loot_health.setProgress(abs(Float(item.getHealth()) / 20), animated: true)
        cell.loot_food.setProgress(abs(Float(item.getFood()) / 20), animated: true)
        cell.loot_fear.setProgress(abs(Float(item.getFear()) / 20), animated: true)
        cell.loot_sleep.setProgress(abs(Float(item.getSleep()) / 20), animated: true)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row <= main!.getMaxItem()) {
            
            let item = main!.getItem(index: indexPath.row)
            
            // Create AlertController
            let alert = AlertController(title: "Utiliser ?", message: "Veux tu utiliser : " + item.getTitle() + " ?", preferredStyle: .alert)
            alert.setTitleImage(UIImage(named: item.getImgPath()))
            
            // Add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Bien Evidement", style: .default, handler: { [self]_ in
                main!.useItem(index: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .left)
                dying(death: main!.isDead(), item: item)
            }))
            
            alert.addAction(UIAlertAction(title: "Nop", style: .cancel, handler: nil))
        
            present(alert, animated: true, completion: nil)
            
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.inventoryTableView.rowHeight = 120
        if let character = main {
            player_name.text = character.getName()
            player_score.text = String(character.getScore())
        }
        
        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
    }
    

    func dying(death: Death, item: Loot) {
        
        if (death != Death.Alive) {
            
            var text = ""
            if let data = NSDataAsset(name: death.rawValue)?.data {
                text = String(data: data, encoding: .utf8)!
            }
            
            // Create AlertController
            let alert = AlertController(title: "Tu viens de mourir a cause de : " + item.getTitle(), message: text, preferredStyle: .alert)
            
            // Add actions
            let action = UIAlertAction(title: "oh sad 😢", style: .cancel, handler: {_ in
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "menuVC") as! ViewController
                print(newViewController)
                self.present(newViewController, animated:true, completion:nil)
                
            })
            
            // Best score
            var best = ""
            if let data = NSDataAsset(name: "HighScore")?.data {
                best = String(data: data, encoding: .utf8)!
            }
            
            let bestScore = Int(best)!
            
            if (main!.getScore() > bestScore) {
                do {
                    print(String(main!.getScore()))
                    try String(main!.getScore()).write(toFile: "HighScore", atomically: false, encoding: .utf8)
                }
                catch {
                    
                }
                
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameViewController {
            vc.main = main!
            vc.current = current!
            
        }
    }

}
