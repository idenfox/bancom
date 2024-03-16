//
//  PokemonCollectionViewCell.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import UIKit
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var typeImageView: UIImageView!
    
    var dittoImgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: PokemonModel) {
        containerView.layer.cornerRadius = 30
        containerView.customizeBorder()
        nameLabel.text = model.name
        typeLabel.text = model.type
        typeImageView.image = getTypeImage()
        let imageUrl = URL(string: model.imgUrl ?? dittoImgUrl)
        pokemonImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "iconPokeball"))
    }
    
    private func getTypeImage() -> UIImage {
        switch typeLabel.text {
        case "fuego", "fire":
            return UIImage(named: "iconFire")!
        case "agua", "water":
            return UIImage(named: "iconWater")!
        case "hoja", "planta", "leaf", "grass":
            return UIImage(named: "iconLeaf")!
        case "electrico", "eléctrico", "electricidad", "trueno", "electric":
            return UIImage(named: "iconElectricity")!
        case "fantasma", "ghost":
            return UIImage(named: "iconElectricity")!
        default:
            return UIImage(named: "iconNormal")!
        }
    }
}
