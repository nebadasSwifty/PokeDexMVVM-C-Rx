//
//  EnemyCollectionCell.swift
//  PokemonAppMVVM+Rx
//
//  Created by Кирилл on 06.06.2022.
//

import UIKit
import SnapKit

class EnemyCollectionCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 175, height: 115)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 175, height: 62)
        label.font.withSize(17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).withAlphaComponent(0.9)
        contentView.layer.cornerRadius = 20
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    private func configureViewsConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(175)
            make.height.equalTo(62)
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(175)
            make.height.equalTo(62)
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(2)
        }
    }
    
    func setupCell(with pokemonDetails: PokemonSelection) {
        let imageURL = URL(string: pokemonDetails.sprites.frontDefault)!
        imageView.kf.setImage(with: imageURL)
        nameLabel.text = pokemonDetails.name
    }
}
