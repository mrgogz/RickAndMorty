//
//  DetailVC.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class DetailVC: UIViewController {
    
    var avatarImageView = AvatarImageView(frame: .zero)
    var characterNameLabel = TitleLabel(textAlignment: .left, fontSize: 15)
    var statusLabel = TitleLabel(textAlignment: .left, fontSize: 15)
    var genderLabel = TitleLabel(textAlignment: .left, fontSize: 15)
    var locationLabel = TitleLabel(textAlignment: .left, fontSize: 15)
    
    var name = TitleLabel(textAlignment: .left, fontSize: 15)
    var status = TitleLabel(textAlignment: .left, fontSize: 15)
    var gender = TitleLabel(textAlignment: .left, fontSize: 15)
    var location = TitleLabel(textAlignment: .left, fontSize: 15)
    
    private var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonTapped))
    }
    
    @objc func favoriteButtonTapped() {
        let currentImage = navigationItem.rightBarButtonItem?.image
        let newImage = currentImage == UIImage(systemName: "heart") ?
        UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        navigationItem.rightBarButtonItem?.image = newImage
        
        var favorite = PersistentManager.shared.readData()
        if favorite.contains(where: { character in
            self.character == character
        }) {
            remove()
        } else {
            add()
        }
    }
    
    func remove() {
        var favorite = PersistentManager.shared.readData()
        favorite.removeAll() { character in
            self.character == character
        }
        PersistentManager.shared.saveData(data: favorite)
    }
    
    func add() {
        var favorite = PersistentManager.shared.readData()
        favorite.append(character)
        PersistentManager.shared.saveData(data: favorite)
    }
    
    func set(character: Character) {
        avatarImageView.downloadImage(fromURL: character.image)
        characterNameLabel.text = character.name
        statusLabel.text = character.status
        genderLabel.text = character.gender
        locationLabel.text = character.location.name
        title = character.name
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        var itemViews = [name, status, gender, location, avatarImageView, characterNameLabel, statusLabel, genderLabel, locationLabel]
        var forLeftBounds = [name, status, gender, location]
        var forRightBounds = [characterNameLabel, statusLabel, genderLabel, locationLabel]
        
        //???
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for leftBounds in forLeftBounds {
            NSLayoutConstraint.activate([
                leftBounds.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])
        }
        
        for rightBounds in forRightBounds {
            NSLayoutConstraint.activate([
                rightBounds.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250)
            ])
        }
        
        name.text = "Name:"
        status.text = "Status:"
        gender.text = "Gender:"
        location.text = "Location:"
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 250),
            avatarImageView.widthAnchor.constraint(equalToConstant: 250),
            
            name.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 35),
            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            gender.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 20),
            location.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 20),
            
            characterNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 35),
            statusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 20),
            genderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            locationLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20),
        ])
    }
    
}
