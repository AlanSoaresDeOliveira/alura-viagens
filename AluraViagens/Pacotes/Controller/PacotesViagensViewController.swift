//
//  PacotesViagensViewController.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 27/11/20.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
       
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var perquisarViagens: UISearchBar!
    @IBOutlet weak var labelContatorPacotes: UILabel!
    
    internal let listaComTodasViagens: [PacoteViagem] = PacoteViagemDAO().retornaTodasAsViagens()
    internal var listaViagens: Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        labelContatorPacotes.text = atualizaContatorLabel()
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        perquisarViagens.delegate = self
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaViagens[indexPath.item]
        
        celula.labelTitulo.text = pacoteAtual.viagem.titulo
        celula.labelQuantidadeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        celula.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
        celula.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
        
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(displayP3Red: 85.0/250.0, green: 85.0/250.0, blue: 85.0/250.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 12, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            //searchText é onde fica guardado as informacoes
        
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let listaFiltrada = listaViagens.filter { (pacote) -> Bool in
                return pacote.viagem.titulo.lowercased().contains(searchText.lowercased())
            }
            listaViagens = listaFiltrada
        }
        labelContatorPacotes.text = atualizaContatorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContatorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }

}
