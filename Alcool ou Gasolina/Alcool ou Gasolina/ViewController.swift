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
                
                if validaCampos == "álcool e gasolina" {
                    
                    self.legendaResultado.text = "Digite o preço do álcool e da gasolina!"
                }
                
                else if validaCampos == "álcool" {
                    
                    self.legendaResultado.text = "Digite o preço do álcool!"
                    
                } else if validaCampos == "gasolina" {
                    
                    legendaResultado.text = "Digite o preço da gasolina!"
                    
                } else {
                    // calcular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
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
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> String {
        
        var camposValidados = ""
        
        if precoAlcool.isEmpty && precoGasolina.isEmpty {
            camposValidados = "álcool e gasolina"
        }
        else if precoAlcool.isEmpty {
            camposValidados = "álcool"
        } else if precoGasolina.isEmpty {
            camposValidados = "gasolina"
        }
        
        return camposValidados
        
    }
    
    
    @IBAction func limpar(_ sender: Any) {
        precoAlcoolCampo.text = ""
        precoGasolinaCampo.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

