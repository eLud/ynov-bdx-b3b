//
//  DwarfDetailsViewController.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 17/05/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class DwarfDetailsViewController: UIViewController {

    var dwarfToDisplay: Nain?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureUI() {
        
        guard let dwarf = dwarfToDisplay else { return }
        self.title = dwarf.nom
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
