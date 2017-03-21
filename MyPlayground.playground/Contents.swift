//: Playground - noun: a place where people can play

import UIKit

//: var est modifiable, let est constant
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

//: La boucle for "classique" n'est plus disponible en Swift. On peut utiliser for-in pour le remplacer rapidement.
for i in 0...10 {
    print(i)
}

for i in 0..<10 {
    print(i)
}

for truc in tab {
    
}

//: # Exo Nains et Bar

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

class Mineur: Nain {
    
    var pioches: Int = 0
    
    override func boire(boisson: BoissonAlcolisée) {
        super.boire(boisson: boisson)
        piocher()
    }
    
    func piocher() {
        
    }
}

//: Un protocole défini des méthodes et propriétés obligatoirement implémentées par les types qui choississent de s'y conformer. Un protocole peut être utilisé comme un type "normal" pour définir des tableaux, des paramètres ou des types de retours.
protocol BoissonAlcolisée {
    
    var quantité: Float { get set }
    var degréAlcool: Float { get }
    func boire()
    func remplir()
}

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


class Bar {
    
    var nains: [Nain] = []
    var tonneaux: [Tonneau] = Array(repeating: Tonneau.bière, count: 20)
    
    func ajouter(nain: Nain) {
        nains.append(nain)
    }

//: Une propriété calculée peut être en "get only", dans ce cas, on peut ne pas mettre le get {}
    var clients: [Nain] {
        return nains
    }
    
    // Retourner un Nain? permet de retourner soit un nain, soit rien (nil). Nain? est un Optional<Nain>.
    func virer(nain: Nain) -> Nain? {
        guard let index = nains.index(of: nain) else {
            return nil
        }
        return nains.remove(at: index)
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
        nain.boire(boisson: t)
    }
    
//: - note: Les modificateurs de portée en Swift sont open > public > internal > fileprivate > private
    
}

let taverne = Bar()
let unInconnu = Nain()
let gimli = Nain(nom: "Gimli", taille: 130, resistance: 10)

taverne.ajouter(nain: gimli)
taverne.ajouter(nain: unInconnu)

taverne.clients
taverne.payerUneTournée(tonneauxParNain: 2)
