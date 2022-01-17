//
//  ViewController.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cellId = "cell"
    
    var categories = ["Temperatura", "Massa", "Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento"]
    
    lazy var collectionCategories: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(cellCategories.self, forCellWithReuseIdentifier: cellId)
        collection.backgroundColor = .blue
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
        label.backgroundColor = .white
        label.adjustsFontForContentSizeCategory = true
        label.text = "Categorias"
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.frame.size = contentViewSize
        //view.backgroundColor = .white
        return view
    }()
    
    lazy var containerCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            
            containerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            
            categoriaTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            categoriaTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            
            ScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            ScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collectionCategories.topAnchor.constraint(equalTo: categoriaTitle.bottomAnchor, constant: 40),
            collectionCategories.heightAnchor.constraint(equalToConstant: 100),
            collectionCategories.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionCategories.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            
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
        return cell
    }

}


