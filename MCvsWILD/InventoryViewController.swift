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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.inventoryTableView.rowHeight = 120
        if let character = main {
            player_name.text = character.getName()
            player_score.text = String(character.getScore())
            print(character.getCurrentItemCount())
        }
        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameViewController {
            vc.main = main!
            vc.current = current!
            
        }
    }

}
