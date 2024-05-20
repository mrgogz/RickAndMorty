//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 17.05.2024.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    private let characterImageView = UIImageView()
    private let backButton = UIBarButtonItem()
    
    private let gender = UILabel()
    private let specy = UILabel()
    private let origin = UILabel()
    private let location = UILabel()
    private let episodes = UILabel()
    private let status = UILabel()
    
    private let genderLabel = UILabel()
    private let specyLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    private let episodesLabel = UILabel()
    private let statusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        callAllFunctions()
    }
    
    func callAllFunctions() {
        configureBackButton()
        configureCharacterImageView()
        configureGender()
        configureGenderLabel()
        configureSpecy()
        configureSpecyLabel()
        configureOrigin()
        configureOriginLabel()
        configureLocation()
        configureLocationLabel()
        configureEpisodes()
        configureEpisodesLabel()
        configureStatus()
        configureStatusLabel()
    }
    
    func configureBackButton() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Rick and Morty", style: .plain, target: nil, action: nil)
    }
    
    func configure(character: Character) {
        characterImageView.image = UIImage(named: character.image)
        genderLabel.text = character.gender.rawValue
        specyLabel.text = character.specy
        originLabel.text = character.origin
        locationLabel.text = character.location
        episodesLabel.text = character.episodes
        statusLabel.text = character.status.rawValue
        self.navigationItem.title = character.name
    }
    
    func configureCharacterImageView() {
        view.addSubview(characterImageView)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 300),
            characterImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureGender() {
        view.addSubview(gender)
        gender.text = "Gender: "
        gender.textAlignment = .left
        gender.font = .systemFont(ofSize: 20, weight: .semibold)
        gender.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gender.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            gender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureGenderLabel() {
        view.addSubview(genderLabel)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 15),
            genderLabel.leadingAnchor.constraint(equalTo: gender.trailingAnchor, constant: 45)
        ])
    }
    
    func configureSpecy() {
        view.addSubview(specy)
        
        specy.text = "Specy: "
        specy.textAlignment = .left
        specy.font = .systemFont(ofSize: 20, weight: .semibold)
        specy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            specy.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 10),
            specy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureSpecyLabel() {
        view.addSubview(specyLabel)
        specyLabel.translatesAutoresizingMaskIntoConstraints = false
        specyLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            specyLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            specyLabel.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor)
        ])
    }
    
    func configureOrigin() {
        view.addSubview(origin)
        
        origin.text = "Origin: "
        origin.textAlignment = .left
        origin.font = .systemFont(ofSize: 20, weight: .semibold)
        origin.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            origin.topAnchor.constraint(equalTo: specy.bottomAnchor, constant: 10),
            origin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureOriginLabel() {
        view.addSubview(originLabel)
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            originLabel.topAnchor.constraint(equalTo: specyLabel.bottomAnchor, constant: 10),
            originLabel.leadingAnchor.constraint(equalTo: specyLabel.leadingAnchor)
        ])
    }
    
    func configureLocation() {
        view.addSubview(location)
        
        location.text = "Location: "
        location.textAlignment = .left
        location.font = .systemFont(ofSize: 20, weight: .semibold)
        location.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: origin.bottomAnchor, constant: 10),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureLocationLabel() {
        view.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: originLabel.leadingAnchor)
        ])
    }
    
    func configureEpisodes() {
        view.addSubview(episodes)
        
        episodes.text = "Episodes: "
        episodes.textAlignment = .left
        episodes.font = .systemFont(ofSize: 20, weight: .semibold)
        episodes.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodes.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 10),
            episodes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureEpisodesLabel() {
        view.addSubview(episodesLabel)
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            episodesLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            episodesLabel.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor)
        ])
    }
    
    func configureStatus() {
        view.addSubview(status)
        
        status.text = "Status: "
        status.textAlignment = .left
        status.font = .systemFont(ofSize: 20, weight: .semibold)
        status.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            status.topAnchor.constraint(equalTo: episodes.bottomAnchor, constant: 10),
            status.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    func configureStatusLabel() {
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 20, weight: .regular)
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: episodesLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: episodesLabel.leadingAnchor)
        ])
    }
    
}
