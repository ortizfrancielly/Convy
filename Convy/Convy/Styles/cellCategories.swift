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
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var labelName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageCell.layer.cornerRadius = (self.frame.height/3.5)
        self.addSubview(imageCell)
        self.addSubview(labelName)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints(){
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height/5).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 65).isActive = true
        imageCell.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        labelName.bottomAnchor.constraint(equalTo: imageCell.topAnchor, constant: 10).isActive = true
        labelName.leadingAnchor.constraint(equalTo: imageCell.leadingAnchor, constant: 20).isActive = true
    }
    
    
}
