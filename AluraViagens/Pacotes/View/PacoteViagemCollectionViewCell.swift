//
//  PacoteViagemCollectionViewCell.swift
//  AluraViagens
//
//  Created by Alan Soares de Oliveira on 27/11/20.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelula(pacote: PacoteViagem) {
        labelTitulo.text = pacote.viagem.titulo
        labelQuantidadeDias.text = pacote.viagem.quantidadeDeDias == 1 ? "1 dia" : "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(displayP3Red: 85.0/250.0, green: 85.0/250.0, blue: 85.0/250.0, alpha: 1).cgColor
        layer.cornerRadius = 8
        
    }
}
