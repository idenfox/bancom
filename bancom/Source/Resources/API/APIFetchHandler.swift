//
//  APIFetchHandler.swift
//  bancom
//
//  Created by Renzo Paul Chamorro on 15/03/24.
//

import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    typealias PokemonDataHandler = (Result<PokemonData, Error>) -> Void
    func fetchPokemonInfo(pokemonNumber: Int = 1, completion: @escaping PokemonDataHandler) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result {
                case .success(let data):
                    do {
                        if let jsonData = data {
                            let pokemonData = try JSONDecoder().decode(PokemonData.self, from: jsonData)
                            completion(.success(pokemonData))
                        } else {
                            completion(.failure(NSError(domain: "APIFetchHandler", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not founded"])))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
