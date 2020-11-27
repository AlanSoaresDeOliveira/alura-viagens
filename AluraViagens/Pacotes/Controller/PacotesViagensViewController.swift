//
//  PacotesViagensViewController.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 27/11/20.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
       

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    let listaDeViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = listaDeViagens[indexPath.item]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco.text = "R$ \(viagemAtual.preco)"
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(displayP3Red: 85.0/250.0, green: 85.0/250.0, blue: 85.0/250.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        
        
        return celula
    }
    

    

}
