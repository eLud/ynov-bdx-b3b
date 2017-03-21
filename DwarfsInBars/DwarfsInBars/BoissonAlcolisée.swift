//
//  BoissonAlcolisée.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 21/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

protocol BoissonAlcolisée {
    
    var quantité: Float { get set }
    var degréAlcool: Float { get }
    func boire()
    func remplir()
}
