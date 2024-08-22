//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    static let reuseID = "CharacterCell"
    var avatarImageView = AvatarImageView(frame: .zero)
    var characterNameLabel = TitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(character: Character) {
        avatarImageView.downloadImage(fromURL: character.image)
        characterNameLabel.text = character.name
    }
    
    private func configure() {
        addSubviews(avatarImageView, characterNameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            characterNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}
