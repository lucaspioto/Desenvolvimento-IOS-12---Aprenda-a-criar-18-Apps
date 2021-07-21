//
//  CadastroTarefaViewController.swift
//  Lista de Tarefas
//
//  Created by Lucas on 21/07/21.
//

import UIKit

class CadastroTarefaViewController: UIViewController {
    
    @IBOutlet weak var tarefaCampo: UITextField!
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let textoDigitado = tarefaCampo.text {
            
            let tarefa = TarefaUserDefaults()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaCampo.text = ""
            
            let dados = tarefa.listar()
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
