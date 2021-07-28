//
//  AnotacaoViewController.swift
//  Notas Diarias
//
//  Created by Lucas on 26/07/21.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {
    
    
    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    var anotacao: NSManagedObject!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuracoes iniciais
        
        self.texto.becomeFirstResponder() // mostrar o teclado
        
        if anotacao != nil { // atualizar
            
            self.texto.text = String(describing: anotacao.value(forKey: "texto")!)

        } else {
            
            self.texto.text = ""
        }
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

    }
    
    @IBAction func salvar(_ sender: Any) {
        
        if anotacao != nil { // atualizar
            
            self.atualizarAnotacao()
            
        } else { // senao salvar
            self.salvarAnotacao()
        }
        
        // retornar para a tela pricipal
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func atualizarAnotacao() {
        
        anotacao.setValue( self.texto.text, forKey: "texto")
        anotacao.setValue( Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao atualizar anotação!")
        } catch let erro {
            print("Erro ao atualizar anotação: \(erro.localizedDescription)" )
        }
        
    }
    
    func salvarAnotacao() {
        
        // cria objeto para anotacao
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        
        // configura anotacao
        novaAnotacao.setValue( self.texto.text, forKey: "texto")
        novaAnotacao.setValue( Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao salvar anotação!")
        } catch let erro {
            print("Erro ao salvar anotação: \(erro.localizedDescription)" )
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
