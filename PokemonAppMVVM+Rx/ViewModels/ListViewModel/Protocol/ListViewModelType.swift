//
//  ListViewModelType.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ListViewModelType {
    var networkService: NetworkServiceType { get }
    var pokemonNameArray: Driver<[PokemonSelection]> { get }
    var nextPageRelay: PublishRelay<Void> { get }
    
    init(networkService: NetworkServiceType)
}
