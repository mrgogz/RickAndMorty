//
//  DetailVC.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    var avatarImageView = AvatarImageView(frame: .zero)
    var characterNameLabel = TitleLabel(textAlignment: .left, fontSize: 10)

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func set(character: Character) {
        avatarImageView.downloadImage(fromURL: character.image ?? "")
        characterNameLabel.text = character.name
    }
    
}
