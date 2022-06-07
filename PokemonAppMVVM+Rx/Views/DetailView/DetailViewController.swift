//
//  DetailViewController.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "imageCell")
        return tableView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: view.bounds)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
    }
    
}
