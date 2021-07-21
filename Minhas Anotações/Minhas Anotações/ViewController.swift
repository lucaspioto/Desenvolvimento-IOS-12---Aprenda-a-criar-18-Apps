//
//  ViewController.swift
//  Minhas Anotações
//
//  Created by Lucas on 20/07/21.
//

import UIKit

class ViewController: UIViewController {

    let chave: String = "minhaAnotacao"
    
    @IBOutlet weak var textoCampo: UITextView!
    
    @IBAction func salvarAnotacao(_ sender: Any) {
        
        if let texto = textoCampo.text {
            
            UserDefaults.standard.set(texto, forKey: chave)
            
        }
        
    }
    
    func recuperarAnotacao() -> String {
        
        if let textoRecuperado = UserDefaults.standard.object(forKey: chave) {
            return textoRecuperado as! String
        }
        return ""
    }

    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textoCampo.text = recuperarAnotacao()
    }


}

