//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Lucas on 19/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var legendaResultado: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
                // validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos {
                    // calcular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                } else {
                    legendaResultado.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        //converte valores textos para números
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                
                /*
                 Faz calculo (precoAlcool / precoGasolina)
                 Se resultado >= 0.7 melhor utilizar gasolina
                 senão melhor utilizar Álcool
                 */
                
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.legendaResultado.text = "Melhor usar gasolina"
                } else {
                    self.legendaResultado.text = "Melhor usar álcool"
                }
            }
        }
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

