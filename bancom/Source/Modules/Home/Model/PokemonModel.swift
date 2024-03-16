//
//  PokemonModel.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import Foundation
import UIKit

class PokemonModel: Codable {
    var id: Int
    var name: String
    var type: String
    var imgUrl: String
    var level: String?
    //var typeImg: UIImage? = nil
    
    init(id: Int, name: String, type: String, imgUrl: String, level: String?) {
        self.id = id
        self.name = name
        self.type = type
        self.imgUrl = imgUrl
        self.level = level
    }
}
