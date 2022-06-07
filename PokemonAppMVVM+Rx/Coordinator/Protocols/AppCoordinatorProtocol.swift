//
//  AppCoordinatorProtocol.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import Foundation
import UIKit

protocol AppCoordinatorType {
    var navigationContoller: UINavigationController { get }
    func start()
}
