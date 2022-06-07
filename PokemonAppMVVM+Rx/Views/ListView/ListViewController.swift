//
//  ListViewController.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
import RxKingfisher

class ListViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 50
        flowLayout.sectionInset = UIEdgeInsets(top: 40, left: 30, bottom: 20, right: 30)
        flowLayout.itemSize = CGSize(width: 170, height: 180)
        collectionView.register(EnemyCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let bag = DisposeBag()
    var viewModel: ListViewModelType!
    var coordinator: AppCoordinatorType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createCollectionView()
        bindToViewModel()
    }
    
    private func setupView() {
        let backgroundImage = UIImageView(frame: view.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        collectionView.backgroundView = backgroundImage
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsWhenVerticallyCompact = true
        title = "Pokemons"
    }
    
    private func createCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func bindToViewModel() {
        collectionView.rx.contentOffset
            .map { $0.y >= (self.collectionView.contentSize.height - self.collectionView.frame.size.height) }
            .asSignal(onErrorJustReturn: false)
            .filter { $0 }
            .map { _ in () }
            .emit(to: self.viewModel.nextPageRelay)
            .disposed(by: bag)
        
        viewModel.pokemonNameArray
            .drive(collectionView.rx.items(cellIdentifier: "Cell", cellType: EnemyCollectionCell.self)) { indexPath, item, cell in
                cell.setupCell(with: item)
            }.disposed(by: bag)
        
        viewModel.nextPageRelay.accept(())
    }
}
