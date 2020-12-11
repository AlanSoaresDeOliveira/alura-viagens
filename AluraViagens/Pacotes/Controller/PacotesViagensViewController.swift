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
        
        celula.configuraCelula(pacote: pacoteAtual)       
        
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width / 2 - 20, height: 160) : CGSize(width: collectionView.bounds.width / 3 - 20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagensViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
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
