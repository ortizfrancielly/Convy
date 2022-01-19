//
//  ViewController.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.

import UIKit




class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
        var cellId = "cell"
        
        var categories = ["Massa", "Temperatura", "Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento"]
        
        lazy var collectionCategories: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.register(cellCategories.self, forCellWithReuseIdentifier: cellId)
            layout.itemSize = CGSize(width: 100, height: 105)
            return collection
        }()
        
        private lazy var infoButton: UIBarButtonItem = {
            var exitButton = UIBarButtonItem()
            exitButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(infoTap(_:)))
            exitButton.tintColor = .blue
            return exitButton
        }()
        
        lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
        
        lazy var ScrollView: UIScrollView = {
            let view = UIScrollView(frame: .zero)
            //view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.contentSize = contentViewSize
            view.frame = self.view.bounds
            return view
        }()
        
        lazy var categoriaTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .preferredFont(forTextStyle: .largeTitle)
            label.adjustsFontForContentSizeCategory = true
            label.text = "Categorias"
            return label
        }()
            
        lazy var questionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .preferredFont(forTextStyle: .headline)
            label.adjustsFontForContentSizeCategory = true
            label.text = "Qual valor você quer converter?"
            return label
        }()
        
        lazy var conversorTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .preferredFont(forTextStyle: .largeTitle)
            label.adjustsFontForContentSizeCategory = true
            label.text = "Conversão"
            return label
        }()
        
        lazy var containerView: UIView = {
            let view = UIView()
            view.frame.size = contentViewSize
            //view.backgroundColor = .white
            return view
        }()
        
        lazy var containerConversor: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 7
            view.layer.shadowColor = .init(gray: 2, alpha: 4)
            view.layer.shadowOpacity = 1
            view.layer.shadowOffset = CGSize(width: 0, height: 3)
            view.layer.shadowRadius = 1
            view.backgroundColor = .lightGray
            return view
        }()
        
        private lazy var constraints: [NSLayoutConstraint] = {
            [
                
                containerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                
                
                categoriaTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
                categoriaTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                
                ScrollView.topAnchor.constraint(equalTo: view.topAnchor),
                ScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                
                collectionCategories.topAnchor.constraint(equalTo: categoriaTitle.bottomAnchor, constant: 32),
                collectionCategories.heightAnchor.constraint(equalToConstant: 110),
                collectionCategories.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                collectionCategories.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                
                conversorTitle.topAnchor.constraint(equalTo: collectionCategories.bottomAnchor, constant: 32),
                conversorTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                
                questionLabel.topAnchor.constraint(equalTo: containerConversor.topAnchor, constant: 24),
                questionLabel.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                
                containerConversor.topAnchor.constraint(equalTo: conversorTitle.bottomAnchor, constant: 32),
                containerConversor.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                containerConversor.heightAnchor.constraint(equalToConstant: 400),
                containerConversor.widthAnchor.constraint(equalToConstant: 380)

                
            ]}()
        

        override func viewDidLoad() {
            super.viewDidLoad()
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationItem.rightBarButtonItem = infoButton
            
            collectionCategories.dataSource = self
            collectionCategories.delegate = self
            
            view.addSubview(ScrollView)
            ScrollView.addSubview(containerView)
            containerView.addSubview(categoriaTitle)
            containerView.addSubview(collectionCategories)
            containerView.addSubview(conversorTitle)
            containerView.addSubview(containerConversor)
            containerConversor.addSubview(questionLabel)
            collectionCategories.frame = view.bounds
            // Do any additional setup after loading the view.
        }
        
        internal override func viewDidLayoutSubviews() {
            NSLayoutConstraint.activate(constraints)
        }
        
        @objc private func infoTap (_ sender: UIButton) {
            print ("oi")
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! cellCategories
            let iconCategories = categories[indexPath.row]
            cell.labelName.text = categories[indexPath.row]
            cell.imageCell.image = UIImage(named: iconCategories)
            cell.buttonTeste.tag = indexPath.item
            cell.buttonTeste.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        
            return cell
        }
        
        @objc func buttonClicked(_ sender: UIButton) {
            if (sender.tag == 0){
                print(Comprimento.metro.unidadeMedida.nome)
            }
            
            else {
                print ("em construção")
            }

    }

}




