//
//  ViewController.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var infoButton: UIBarButtonItem = {
        var exitButton = UIBarButtonItem()
        exitButton = UIBarButtonItem(title: "Informação", style: UIBarButtonItem.Style.plain, target: self, action: #selector(infoTap(_:)))
        exitButton.tintColor = .blue
        return exitButton
    }()
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    lazy var ScrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        //scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentSize = contentViewSize
        view.frame = self.view.bounds
        //scrollView.isHidden = true
        return view
    }()
    
    lazy var categoriaTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Texto para testar scrollview"
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        view.backgroundColor = .white
        return view
    }()
    
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            categoriaTitle.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            categoriaTitle.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor)
        ]}()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItem = infoButton
        
        view.addSubview(ScrollView)
        ScrollView.addSubview(containerView)
        containerView.addSubview(categoriaTitle)
        // Do any additional setup after loading the view.
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func infoTap (_ sender: UIButton) {
        print ("oi")
    }

}

