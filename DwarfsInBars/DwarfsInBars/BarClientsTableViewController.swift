//
//  BarClientsTableViewController.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 17/05/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class BarClientsTableViewController: UITableViewController {
    
    var bar = Bar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name("modelUpdated"), object: nil, queue: OperationQueue.main) { (notif) in
            self.tableView.reloadData()
        }
        
        for i in 0...10 {
            
            let randomInt = Int(arc4random_uniform(UInt32(Nain.ResistanceEthylique.count - 1)))
            
            let n = Nain(nom: "Nain n°\(i)", taille: 40.6, resistance: Nain.ResistanceEthylique(rawValue: randomInt)!)
            bar.ajouter(n)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bar.clients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomDwarfTableViewCell else { fatalError() }

        // Configure the cell...
        let currentDwarf = bar.clients[indexPath.row]
        
        cell.dwarfNameLabel.text = currentDwarf.nom
        
        let progress = Float(currentDwarf.resistanceEthylique.rawValue) / 4.0
        
        cell.ethyicprogressView.progress = progress
        
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor.red
//        } else {
//            cell.backgroundColor = UIColor.green
//        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetails" {
            let destination = segue.destination as! DwarfDetailsViewController
            
            guard let cell = sender as? CustomDwarfTableViewCell else { return }
            guard let index = tableView.indexPath(for: cell)?.row else { return }
            
            let nain = bar.clients[index]
            destination.dwarfToDisplay = nain
            
        } else if segue.identifier == "showForm" {
            
            let destination = segue.destination as! ViewController
            destination.bar = self.bar
            
        }
    }


}
