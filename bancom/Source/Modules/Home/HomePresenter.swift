//
//  HomePresenter.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoad()
    func addPokemon(texts: [String])
}

class HomePresenter {
    weak var view: HomeViewProtocol?
    
    private func createLogoutTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 180, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
    }
    
    private func savePokemon(newModel: PokemonModel) {
        var storedArray = getAllStoredPokemon()
        storedArray.append(newModel)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(storedArray){
           UserDefaults.standard.set(encoded, forKey: "pokemonArrayKey")
            view?.updateStoredPokemonColection(array: storedArray)
        }
    }
    
    private func getAllStoredPokemon() -> [PokemonModel] {
        if let objects = UserDefaults.standard.value(forKey: "pokemonArrayKey") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [PokemonModel] {
                return objectsDecoded
            } else {
                return []
            }
        } else {
            return []
        }
    }
    
    @objc func fireTimer() {
        let alertAction = UIAlertAction(title: "Ok", style: .default) { action in
            self.view?.popToLogin()
        }
        view?.showAlert(message: "Su sesión ha expirado, por favor vuelva a logearse", alertAction: alertAction)
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        createLogoutTimer()
        let storedPokemon = getAllStoredPokemon()
        view?.updateStoredPokemonColection(array: storedPokemon)
    }
    
    func addPokemon(texts: [String]) {
        guard !texts.isEmpty else { return }
        for text in texts {
            guard text != "" else { return }
        }
        let model = PokemonModel(id: 0,
                                 name: texts[0],
                                 type: texts[1],
                                 imgUrl: "",
                                 level: texts[2])
        savePokemon(newModel: model)
    }
}
