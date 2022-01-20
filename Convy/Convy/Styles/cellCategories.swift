//
//  cellCategories.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.
//

import Foundation
import UIKit

class cellCategories: UICollectionViewCell {
    
    var buttonTeste: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var imageCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var labelName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 60, y: 60, width: 60, height: 60)
        //imageCell.layer.cornerRadius = (self.frame.height/3.5)
        self.addSubview(imageCell)
        self.addSubview(labelName)
        self.addSubview(buttonTeste)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints(){
        
        imageCell.translatesAutoresizingMaskIntoConstraints = false
//        imageCell.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height/5).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageCell.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageCell.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageCell.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -5).isActive = true
        
        buttonTeste.heightAnchor.constraint(equalToConstant: 80).isActive = true
        buttonTeste.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonTeste.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttonTeste.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -5).isActive = true
        
    
        labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        labelName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    
    
}
