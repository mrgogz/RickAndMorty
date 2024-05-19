//
//  TableViewCell.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 16.05.2024.
//

import UIKit


class TableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let genderLabel = UILabel()
    private let characterImageView = UIImageView()
    private let coloredDot = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    func configure(character: Character) {
        characterImageView.image = UIImage(named: character.image)
        nameLabel.text = character.name
        genderLabel.text = character.gender.rawValue

        switch character.gender {
        case .male:
            coloredDot.backgroundColor = .systemBlue
        case .female:
            coloredDot.backgroundColor = .systemRed
        case .unknown:
            coloredDot.backgroundColor = .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureCharacterImageView()
        configureNameLabel()
        configureColoredDot()
        configureGenderLabel()
    }
    
    func configureCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor)
        ])
    }
    
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    func configureGenderLabel() {
        addSubview(genderLabel)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.textAlignment = .left
        genderLabel.numberOfLines = 1
        genderLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: coloredDot.topAnchor, constant: -6),
            genderLabel.leadingAnchor.constraint(equalTo: coloredDot.trailingAnchor, constant: 10),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    func configureColoredDot() {
        addSubview(coloredDot)
        coloredDot.translatesAutoresizingMaskIntoConstraints = false
        coloredDot.layer.cornerRadius = 4
        
        NSLayoutConstraint.activate([
            coloredDot.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14),
            coloredDot.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 15),
            coloredDot.heightAnchor.constraint(equalToConstant: 8),
            coloredDot.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}


