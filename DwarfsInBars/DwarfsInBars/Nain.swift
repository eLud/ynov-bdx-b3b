//
//  Nain.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 21/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

class Nain {
    
    var taille: Float
    let nom: String
    var resistanceEthylique: Int
    
    init() {
        taille = 130
        nom = "Gworlf"
        resistanceEthylique = 4
    }
    
    init(nom: String, taille: Float, resistance: Int) {
        self.nom = nom
        self.taille = taille
        resistanceEthylique = resistance
    }
    
    //: Par défaut, les méthodes exposent les noms des paramètres lors de l'appel. On peut intervenir sur ce comportement en proposant un autre nom, ou en choisissant de le masquer.
    
    /// Cette méthode déclenche une attaque
    func attaque(_ opposant: Nain, avec arme: String, force: Int) -> Int {
        
        return 0
    }
    
    func boire(boisson: BoissonAlcolisée) {
        
    }
    
    func vomir() {
        
    }
}

//: On utilise souvent des extensions pour rajouter des conformités à des protocoles
//: Le protocole Equatable permet de définir l'égalité de valeur entre deux nains
extension Nain: Equatable {
    
    static func ==(lhs: Nain, rhs: Nain) -> Bool {
        if lhs.nom == rhs.nom && lhs.taille == rhs.taille {
            return true
        }
        return false
    }
}
