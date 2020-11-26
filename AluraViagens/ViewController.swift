//
//  ViewController.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 24/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
      
    @IBOutlet weak var tabelaViagem: UITableView!
    
    let listaDeViagens: [String] = ["Rio de Janeiro", "Ceará", "São Paulo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagem.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        celula.textLabel?.text = listaDeViagens[indexPath.row]
        
        return celula
    }


}

