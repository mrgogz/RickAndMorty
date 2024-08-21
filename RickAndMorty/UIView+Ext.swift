//
//  UIView+Ext.swift
//  RickAndMorty
//
//  Created by Oğuzcan Beşerikli on 21.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
