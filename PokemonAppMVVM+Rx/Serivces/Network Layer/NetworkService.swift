//
//  NetworkService.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire


final class NetworkService: NetworkServiceType {
    var url = "https://pokeapi.co/api/v2/pokemon"
    func fetchName() -> Observable<Pokemon> {
        return RxAlamofire.data(.get, url)
            .map { response in
                do {
                    let data = try JSONDecoder().decode(Pokemon.self, from: response)
                    self.url = data.next ?? ""
                    return data
                }
            }
            .asObservable()
    }
    
    func fetchDetailSelection(url: String) -> Observable<PokemonSelection> {
        guard let url = URL(string: url) else { return Observable.empty() }
        return RxAlamofire.data(.get, url)
            .map { response -> PokemonSelection in
                do {
                    let data = try JSONDecoder().decode(PokemonSelection.self, from: response)
                    return data
                }
            }
    }
}
