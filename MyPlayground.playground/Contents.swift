//: Playground - noun: a place where people can play

import UIKit

// var est modifiable, let est constant
var str = "Hello, playground"
let str2 = "Hello, playground"

str = "toto"
//str2 = "toto"

let a = 5
let b: Int = 2
let c = Float(a) / Float(b)

let d: Float = 5.3
let s = "X"

var tab: [Int] = [5, 8, 9, 56, 54]
let tab2 = [Int]()
let tab3: Array<Int> = []

tab[0...3] = [42, 76, 87 , 54, 43, 7, 6]
tab

for i in 0...10 {
    print(i)
}

for i in 0..<10 {
    print(i)
}

for truc in tab {
    
}

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
    
    func attaque(arme: String, force: Int, opposant: Nain) -> Int {
        
        return 0
    }
    
    func boire(tonneaux: Int) {
        
    }
    
    func vomir() {
        
    }
}

class Mineur: Nain {
    
    var pioches: Int = 0
    
    override func boire(tonneaux: Int) {
        super.boire(tonneaux: tonneaux)
        piocher()
    }
    
    func piocher() {
        
    }
}

protocol Contenant {
    
    var contenance: Int { get }
    func boire()
    func remplir()
}

struct Tonneau: Contenant {
    
    enum Matière {
        case chêne
        case acajou
        case terreCuite
    }
    
    let contenance: Int
    var volumeRestant: Float
    let degréAlcool: Float
    let matière: Matière
    
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

// Nain est une classe : Référence, héritage simple possible
let nain2 = Nain(nom: "Passe Partout", taille: 120, resistance: 2)
let nain3 = nain2
nain2.taille = 110
nain2.taille
nain3.taille

// Tonneau est une structure : Copie, pas d'héritage
var t = Tonneau(contenance: 40, degréAlcool: 80, matière: .chêne)
let t2 = t
t.volumeRestant = 20.0
t.volumeRestant
t2.volumeRestant






