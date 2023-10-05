//
//  APIPokemon.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 04/10/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Alamofire

final class APIPokemon {

    @discardableResult
    static func getListPokemons(limit: Int, offset: Int, completionHandler: APICompletion<PokemonList>?) -> Request? {
        return NetworkingController.shared
            .performRequest(PokemonService.listPokemons(limit: limit, offset: offset),
                            for: PokemonList.self) { result in
                completionHandler?(result)
            }
    }
}
