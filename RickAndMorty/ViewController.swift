//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 14.05.2024.
//

import UIKit

struct Character {
    let name: String
    let image: String
    let gender: Gender
    let specy: String
    let origin: String
    let location: String
    let episodes: String
    let status: Status
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case unknown = "Unknown"
}

enum Status: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

class ViewController: UIViewController {
    let mainTitleLabel = UILabel()
    var tableView = UITableView()
    let characters: [Character] = [
        .init(name: "Rick Sanchez", image: "img1", gender: .male, specy: "Human",origin: "Earth (C-137)", location: "Earth (C-137)", episodes: "1,2,3,4,5", status: .alive),
        .init(name: "Morty Smith", image: "img2", gender: .male, specy: "Human",origin: "Earth (C-137)", location: "Earth (C-137)", episodes: "1,2,3,4,5", status: .alive),
        .init(name: "Diane Sanchez", image: "img3", gender: .female, specy: "Human",origin: "Earth (C-137)", location: "Earth (C-137)", episodes: "1,2,3,4,5", status: .alive),
        .init(name: "Mr. Poopybutthole", image: "img4", gender: .unknown, specy: "",origin: "", location: "", episodes: "", status: .alive),
        .init(name: "Jerry Smith Primei", image: "img5", gender: .male, specy: "",origin: "", location: "", episodes: "", status: .alive),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureMainTitleLabel()
        configureTableView()
    }
    
    func configureMainTitleLabel() {
        view.addSubview(mainTitleLabel)
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.text = "Rick and Morty"
        mainTitleLabel.textAlignment = .left
        mainTitleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mainTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configure(character: characters[indexPath.row])
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        let vc = CharacterDetailViewController()
        vc.configure(character: selectedCharacter)
        navigationController?.pushViewController(vc, animated: true)
    }
}

