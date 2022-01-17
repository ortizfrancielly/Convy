//
//  cellCategories.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.
//

import Foundation
import UIKit

class cellCategories: UICollectionViewCell {
    
    var imageCell: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemBlue
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
//    override init(style: UICollectionViewCell.cellCategories, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        imageCell.layer.cornerRadius = (self.frame.height/3.5)
//        self.addSubview(imageCell)
//        addConstraints()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints(){
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height/5).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 65).isActive = true
        imageCell.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
    
    
}
