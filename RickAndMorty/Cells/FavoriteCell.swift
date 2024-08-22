//
//  FavoriteCell.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 22.08.2024.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    var avatarImageView = AvatarImageView(frame: .zero)
    var characterNameLabel = TitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Character) {
        avatarImageView.downloadImage(fromURL: favorite.image)
        characterNameLabel.text = favorite.name
    }
    
    private func configure() {
        addSubviews(avatarImageView, characterNameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 65),
            avatarImageView.widthAnchor.constraint(equalToConstant: 65),
            
            characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25)
        ])
        
    }
    
}
