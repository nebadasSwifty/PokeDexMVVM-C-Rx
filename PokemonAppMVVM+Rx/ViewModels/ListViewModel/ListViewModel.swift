//
//  ViewModel.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ListViewModel: ListViewModelType {
    private var selectedIndexPath: IndexPath?
    let networkService: NetworkServiceType
    var pokemonNameArray: Driver<[PokemonSelection]>
    let nextPageRelay = PublishRelay<Void>()
    
    required init(networkService: NetworkServiceType) {
        let activityIndicator = ActivityIndicator()
        let activity = activityIndicator.asObservable()
            .startWith(false)
        
        self.networkService = networkService
        pokemonNameArray = nextPageRelay
            .withLatestFrom(activity)
            .filter{ !$0 }
            .flatMapLatest { _ in
                networkService.fetchName()
                    .map { $0.results }
                    .flatMapLatest { responseArray in
                        Observable.combineLatest( responseArray.map { item in
                            networkService.fetchDetailSelection(url: item.url)
                        })
                    }
                    .trackActivity(activityIndicator)
            }
            .scan([], accumulator: { $0 + $1 })
            .asDriver(onErrorJustReturn: [])
    }
}
