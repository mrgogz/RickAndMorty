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
    var colorView = UIView()
    
    private var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        checkData()
        configureColorView()
    }
    
    func set(character: Character) {
        avatarImageView.downloadImage(fromURL: character.image)
        characterNameLabel.text = character.name
        statusLabel.text = character.status
        genderLabel.text = character.gender
        locationLabel.text = character.location.name
        title = character.name
    }
    
    private func checkData() {
        let favoriteCharacter = PersistentManager.shared.readData()
        if favoriteCharacter.contains (where: { $0 == character })  {
            configureRemoveFavoritesButton()
        }
        else {
            configureAddFavoritesButton()
        }
    }
    
    private func configureAddFavoritesButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addFavorite))
    }
    
    private func configureRemoveFavoritesButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(removeFavorite))
    }
    
    @objc private func addFavorite() {
        guard let character = character else { return }
        
        var favoriteCharacter = PersistentManager.shared.readData()
        favoriteCharacter.append(character)
        PersistentManager.shared.saveData(data: favoriteCharacter)
        configureRemoveFavoritesButton()
    }
    
    @objc private func removeFavorite() {
        guard let character = character else { return }
        
        var favoriteCharacter = PersistentManager.shared.readData()
        favoriteCharacter.removeAll { $0 == character }
        PersistentManager.shared.saveData(data: favoriteCharacter)
        configureAddFavoritesButton()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        let itemViews = [name, status, gender, location, avatarImageView, characterNameLabel, statusLabel, genderLabel, locationLabel]
        let forLeftBounds = [name, status, gender, location]
        let forRightBounds = [characterNameLabel, statusLabel, genderLabel, locationLabel]
        
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
    
    private func configureColorView() {
        view.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 22),
            colorView.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -165),
            colorView.widthAnchor.constraint(equalToConstant: 14),
            colorView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        switch genderLabel.text {
        case "Male":
            colorView.backgroundColor = .systemBlue
        case "Female":
            colorView.backgroundColor = .systemPink
        default:
            colorView.backgroundColor = .black
        }
    }
}
