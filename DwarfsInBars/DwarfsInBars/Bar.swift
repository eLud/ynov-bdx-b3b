//
//  Bar.swift
//  DwarfsInBars
//
//  Created by Ludovic Ollagnier on 21/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

class Bar {
    
    private var nains: [Nain] = []
    private var tonneaux: [Tonneau] = Array(repeating: Tonneau.bière, count: 20)
    
    func ajouter(_ nain: Nain) {
        nains.append(nain)
    }
    
    //: Une propriété calculée peut être en "get only", dans ce cas, on peut ne pas mettre le get {}
    var clients: [Nain] {
        return nains
    }
    
    // Retourner un Nain? permet de retourner soit un nain, soit rien (nil). Nain? est un Optional<Nain>.
    func virer(nain: Nain) -> Nain? {
        
        guard let index = nains.index(of: nain) else { return nil }
        let nainViré = nains.remove(at: index)
        return nainViré
    }
    
    func payerUneTournée(tonneauxParNain: Int) {
        
        guard tonneauxParNain*nains.count <= tonneaux.count else {
            print("Pas assez de stock pour cette tournée")
            return
        }
        
        for nain in nains {
            for _ in 0..<tonneauxParNain {
                let t = tonneaux.removeLast()
                servir(nain: nain, boisson: t)
            }
        }
        
        print("Tournée payée, il reste \(tonneaux.count) tonneaux")
    }
    
    //: En private, cette méthode n'est accessible que depuis l'intérieur de la classe.
    private func servir(nain: Nain, boisson: BoissonAlcolisée) {
        nain.boire(boisson: boisson)
    }
    
    //: - note: Les modificateurs de portée en Swift sont open > public > internal > fileprivate > private
    
}
