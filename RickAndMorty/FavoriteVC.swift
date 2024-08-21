//
//  FavoriteVC.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

class FavoriteVC: UIViewController {

    var collectionView: UICollectionView!
    var favorite: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFavorites()
    }
    
    func loadFavorites() {
        favorite = PersistentManager.shared.readData()
        collectionView.reloadData()
    }
}
