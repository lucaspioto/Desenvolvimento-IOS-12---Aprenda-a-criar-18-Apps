//
//  TarefaUserDefaults.swift
//  Lista de Tarefas
//
//  Created by Lucas on 21/07/21.
//

import UIKit

class TarefaUserDefaults {
    
    let chave = "listaTarefas"
    var tarefas: [String] = []
    
    // remover tarefa
    func remover(indice: Int) {
        
        // recuperar tarefas já salvas
        tarefas = listar()
        
        tarefas.remove(at: indice)
        UserDefaults.standard.set( tarefas, forKey: chave)
    }
    
    func salvar(tarefa: String) {
        
        // recuperar tarefas já salvas
        tarefas = listar()
        
        // salvar tarefa
        tarefas.append( tarefa )
        UserDefaults.standard.set( tarefas, forKey: chave)
        
    }
    
    func listar() -> Array<String>{
        
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil {
            
            return dados as! Array<String>
            
        } else {
            
            return []
        }
    }
    
}
