//
//  AppCoordinator.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import UIKit

class AppCoordinator: AppCoordinatorType {
    var navigationContoller: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationContoller = navigationController
    }
    
    func start() {
        let vc = ListViewController()
        let networkSevice = NetworkService()
        vc.viewModel = ListViewModel(networkService: networkSevice)
        vc.coordinator = self
        navigationContoller.title = "Pokemons"
        navigationContoller.pushViewController(vc, animated: true)
    }
    
}
