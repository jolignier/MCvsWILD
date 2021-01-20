//
//  ScoreViewController.swift
//  MCvsWILD
//
//  Created by “Valentin Joly” on 20/01/2021.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let request: NSFetchRequest<Score> = Score.fetchRequest()
        guard let scores = try? AppDelegate.viewContext.fetch(request) else {
            return 0
        }
        
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = scoreTableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreTableViewCell
        cell.player_name.text = "non player"
        cell.player_score.text = "0"
        let request: NSFetchRequest<Score> = Score.fetchRequest()
        guard let scores = try? AppDelegate.viewContext.fetch(request) else {
            return cell
        }
        
        let row = indexPath.row
        
        cell.player_name.text = scores[row].name
        cell.player_score.text = String(scores[row].score)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
