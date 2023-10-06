//
//  ExampleVM.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 04/01/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation

final class ExampleVM {

    // MARK: - Properties
    private(set) var pokemons: [Pokemon] = []
    private var offset: Int = 0

    // MARK: - Public functions
    func viewModelForItem(at indexPath: IndexPath) -> ExampleCellVM? {
        let viewModel = ExampleCellVM(pokemon: pokemons[safe: indexPath.row])
        return viewModel
    }

    func performGetListPokemons(completion: @escaping APICompletion<PokemonList>) {
        APIPokemon.getListPokemons(limit: 10, offset: offset) { response in
            switch response {
            case .success(let pokemonList):
                if let pokemonList = pokemonList {
                    self.pokemons = pokemonList.results
                }
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
