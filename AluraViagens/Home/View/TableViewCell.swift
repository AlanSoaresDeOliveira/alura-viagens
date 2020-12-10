//
//  TableViewCell.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 26/11/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configurandoCelula(viagem: Viagem) {
       labelTitulo.text = viagem.titulo
        labelQuantidadeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
       labelPreco.text = "R$ \(viagem.preco)"
       imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
       
       imagemViagem.layer.cornerRadius = 10
       imagemViagem.layer.masksToBounds = true
    }
}
