//
//  Tonneau.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 21/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

struct Tonneau: BoissonAlcolisée {
    
    enum Matière {
        case chêne
        case acajou
        case terreCuite
    }
    
    let contenance: Int
    var volumeRestant: Float
    let degréAlcool: Float
    let matière: Matière
    
    //: On peut définir des propriétés calculées, qui ne stockent pas directement de valeurs, mais effectuent un calcul (simple) pour les retourner (complexité O(1) dans l'idéal).
    var quantité: Float {
        get {
            return volumeRestant
        }
        
        set {
            volumeRestant = newValue
        }
    }
    
    //: Avec static on défini une propriété de type. Cette variable (ou méthode), est accessible sur le type, et non sur une instance donnée.
    static var bière: Tonneau {
        return Tonneau(contenance: 20, degréAlcool: 8, matière: .acajou)
    }
    
    
    init(contenance: Int, degréAlcool: Float, matière: Matière) {
        self.contenance = contenance
        self.volumeRestant = Float(contenance)
        self.degréAlcool = degréAlcool
        self.matière = matière
    }
    
    func boire() {
        
    }
    
    func remplir() {
        
    }
}
