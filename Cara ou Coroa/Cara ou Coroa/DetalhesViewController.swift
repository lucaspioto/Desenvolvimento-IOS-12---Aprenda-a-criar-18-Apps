//
//  DetalhesViewController.swift
//  Cara ou Coroa
//
//  Created by Lucas on 20/07/21.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var numRandom: Int!
    @IBOutlet weak var moedaImagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if numRandom == 0 { // cara
            moedaImagem.image = #imageLiteral(resourceName: "moeda_cara")
        } else { // coroa
            moedaImagem.image = #imageLiteral(resourceName: "moeda_coroa")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
