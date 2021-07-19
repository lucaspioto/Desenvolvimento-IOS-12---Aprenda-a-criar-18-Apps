//
//  ViewController.swift
//  Frases do dia
//
//  Created by Lucas on 19/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var legendaResultado: UILabel!
    @IBAction func novaFrase(_ sender: Any) {
        var frases: [String] = []
        frases.append("As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.")
        frases.append("A verdadeira motivação vem de realização, desenvolvimento pessoal, satisfação no trabalho e reconhecimento.")
        frases.append("Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.")
        frases.append("Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.")
        frases.append("Quando você quer alguma coisa, todo o universo conspira para que você realize o seu desejo.")
        frases.append("O insucesso é apenas uma oportunidade para recomeçar com mais inteligência.")
        
        let random = arc4random_uniform(6)
        legendaResultado.text = frases[Int(random)]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

