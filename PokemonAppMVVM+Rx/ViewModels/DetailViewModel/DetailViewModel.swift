//
//  DetailViewModel.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 07.06.2022.
//

import Foundation
import RxSwift
import RxCocoa


class DetailViewModel: DetailViewModelType {
    private var selectedPokemon: Driver<PokemonSelection>
    
    
    init(pokemon: Driver<PokemonSelection>) {
        selectedPokemon = pokemon
    }
}
