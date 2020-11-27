//
//  ViewController.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 24/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      
    @IBOutlet weak var tabelaViagem: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    let listaDeViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagem.dataSource = self
        self.tabelaViagem.delegate = self
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaDeViagens[indexPath.row]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco.text = "R$ \(viagemAtual.preco)"
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.imagemViagem.layer.cornerRadius = 10
        celula.imagemViagem.layer.masksToBounds = true
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }


}

