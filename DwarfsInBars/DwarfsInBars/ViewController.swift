//
//  ViewController.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 21/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var selectedSizeLabel: UILabel!
    @IBOutlet weak var ethylicResistanceSegmentedControl: UISegmentedControl!
    
    private var bar = Bar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        let size = sizeSlider.value
        let ethylicIndex = ethylicResistanceSegmentedControl.selectedSegmentIndex
        guard let ethylicResistance = Nain.ResistanceEthylique(rawValue: ethylicIndex) else { return }
        
        let nain = Nain(nom: name, taille: size, resistance: ethylicResistance)
        bar.ajouter(nain)
    }
    
    @IBAction func list(_ sender: Any) {
        
        print(bar.clients)
    }
    
    @IBAction func selectedSizeDidChange(_ sender: UISlider) {
        
        let intSize = Int(sender.value)
        sender.value = Float(intSize)
        
        selectedSizeLabel.text = "\(intSize) cm"
    }
}

