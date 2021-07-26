//
//  ArmazenamentoDados.swift
//  Minhas Viagens
//
//  Created by Lucas on 25/07/21.
//

import UIKit

class ArmazenamentoDados {
    
    let chaveArmazenamento = "locaisViagens"
    var viagens: [ Dictionary<String, String> ] = []
    
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    
    func salvarViagens( viagem: Dictionary<String, String> ) {
        viagens = listarViagens()
        
        viagens.append( viagem )
        
        getDefaults().set( viagens, forKey: chaveArmazenamento )
        getDefaults().synchronize()
    }
    
    func listarViagens() -> [ Dictionary<String, String> ] {
        let dados = getDefaults().object(forKey: chaveArmazenamento )
        if dados != nil {
            return dados as! [Dictionary<String, String>]
        } else {
            return []
        }
    }
    
    func removerViagens(indice: Int) {
        
        viagens = listarViagens()
        viagens.remove(at: indice)
        
        getDefaults().set( viagens, forKey: chaveArmazenamento )
        getDefaults().synchronize()
    }
    
}
