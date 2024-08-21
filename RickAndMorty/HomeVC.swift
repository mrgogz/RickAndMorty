//
//  HomeVC.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var characters: [Character] = []
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Rick and Morty"
        configureCollectionView()
        Task { await getCharacters(page: 1)
            collectionView.reloadData()
        }
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getCharacters(page: Int) async {
        do {
            characters = try await NetworkManager.shared.getCharacters(page: page)
        } catch {
            print(error)
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        cell.set(character: characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        let vc = DetailVC()
        vc.set(character: selectedCharacter)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let availableWidth = collectionView.frame.width - padding * 3
        let itemWidth = availableWidth / 2
        
        return CGSize(width: itemWidth, height: itemWidth + 25)
    }
}
