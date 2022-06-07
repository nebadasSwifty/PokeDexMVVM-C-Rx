//
//  NetworkServiceType.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation
import RxSwift

protocol NetworkServiceType {
    func fetchName() -> Observable<Pokemon>
    func fetchDetailSelection(url: String) -> Observable<PokemonSelection>
}
