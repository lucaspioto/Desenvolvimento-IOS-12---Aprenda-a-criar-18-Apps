//
//  ViewController.swift
//  Filmes
//
//  Created by Lucas on 20/07/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes:[Filme] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        var filme: Filme
        
        filme = Filme(titulo: "007 - Spectre", descricao: "Descrição 1", imagem: UIImage(named: "filme1")!)
        filmes.append(filme)

        filme = Filme(titulo: "Star Wars", descricao: "Descrição 2", imagem: UIImage(named: "filme2")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Impacto Mortal", descricao: "Descrição 3", imagem: UIImage(named: "filme3")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Deadpool", descricao: "Descrição 4", imagem: UIImage(named: "filme4")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "O Regresso", descricao: "Descrição 5", imagem: UIImage(named: "filme5")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "A Herdeira", descricao: "Descrição 6", imagem: UIImage(named: "filme6")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Caçadores de emoção", descricao: "Descrição 7", imagem: UIImage(named: "filme7")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Regresso do mal", descricao: "Descrição 8", imagem: UIImage(named: "filme8")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Tarzan", descricao: "Descrição 9", imagem: UIImage(named: "filme9")!)
        filmes.append(filme)
        
        filme = Filme(titulo: "Hardcore", descricao: "Descrição 10", imagem: UIImage(named: "filme10")!)
        filmes.append(filme)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme: Filme = filmes[indexPath.row]
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        
        celula.filmeImageView.image = filme.imagem
        celula.tituloLabel.text = filme.titulo
        celula.descricaoLabel.text = filme.descricao
        
        // imagens arredondadas
        celula.filmeImageView.layer.cornerRadius = 84/2
        celula.filmeImageView.clipsToBounds = true
        
        // celula.textLabel?.text = filme.titulo
        // celula.imageView?.image = filme.imagem
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheFilme" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let filmeSelecionado = self.filmes[indexPath.row]
                let viewDestino = segue.destination as! DetalhesFilmeViewController
                viewDestino.filme = filmeSelecionado
                
            }
            
        }
        
    }

}

