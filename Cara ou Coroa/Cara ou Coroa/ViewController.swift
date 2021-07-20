//
//  ViewController.swift
//  Cara ou Coroa
//
//  Created by Lucas on 20/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "jogarMoeda" {
            let viewDestino = segue.destination as! DetalhesViewController
            viewDestino.numRandom = Int ( arc4random_uniform(2) )
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

