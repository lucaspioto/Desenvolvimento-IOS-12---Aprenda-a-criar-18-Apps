//
//  ViewController.swift
//  Signos
//
//  Created by Lucas on 20/07/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var signos:[String] = []
    var significadoSignos:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configura signos // adiciona ao array
        
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sagitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        
        // Significados
        significadoSignos.append("O ariano...")
        significadoSignos.append("O taurino...")
        significadoSignos.append("O geminiano...")
        significadoSignos.append("O canceriano...")
        significadoSignos.append("O leonino...")
        significadoSignos.append("O virginiano...")
        significadoSignos.append("O libriano...")
        significadoSignos.append("O escorpiano...")
        significadoSignos.append("O sagitariano...")
        significadoSignos.append("O capricorniano...")
        significadoSignos.append("O aquariano...")
        significadoSignos.append("O pisciano...")

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alerta = UIAlertController(title: "Significado do Signo", message: significadoSignos[indexPath.row], preferredStyle: .alert)
        
        let fechar = UIAlertAction(title: "Fechar", style: .destructive, handler: nil)
        
        alerta.addAction(fechar)
        
        present(alerta, animated: true, completion: nil)
    }


}

