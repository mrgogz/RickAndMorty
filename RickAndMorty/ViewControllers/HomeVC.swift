//
//  HomeVC.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var page = 1
    var hasMoreCharacter = true
    var characters: [Character] = []
    var filteredCharacters: [Character] = []
    var collectionView: UICollectionView!
    var isLoadingMoreCharacters = false
    var searchController: UISearchController!
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Rick and Morty"
        configureSearchController()
        configureCollectionView()
        Task { await getCharacters(page: 1)
            collectionView.reloadData()
        }
    }
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a character"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
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
            let characters = try await NetworkManager.shared.getCharacters(page: page)
            self.characters.append(contentsOf: characters)
            collectionView.reloadData()
        } catch {
            print(error)
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isSearching ? filteredCharacters.count : characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        let activeArray = isSearching ? filteredCharacters : characters
        cell.set(character: activeArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredCharacters : characters
        let selectedCharacter = activeArray[indexPath.row]
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreCharacter, !isLoadingMoreCharacters else { return }
            page += 1
            Task { await getCharacters(page: page) }
        }
    }
}

extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredCharacters = characters
            collectionView.reloadData()
            isSearching = false
            return
        }
        isSearching = true
        filteredCharacters = characters.filter { character in
            character.name.lowercased().contains(filter.lowercased())
        }
        collectionView.reloadData()
    }
}
