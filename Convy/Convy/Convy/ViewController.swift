//
//  ViewController.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 15/01/22.

import UIKit

func getNumber (number: Double) -> Double {
    inputUser = number
    return inputUser
}

var verificationPicker = 0

var inputUser = 0.0

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    
    
            var cellId = "cell"
            
            var categories = ["Massa", "Temperatura", "Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento","Dados", "Comprimento"]
        
    
            private let baseInicialDelegate = BaseInicialDelegate()
            private let baseInicialDataSource = BaseInicialDataSource()
            private lazy var pickerViewBaseInicial: UIPickerView = {
                let picker = UIPickerView()
                picker.translatesAutoresizingMaskIntoConstraints = false
                picker.dataSource = baseInicialDataSource
                picker.delegate = baseInicialDelegate
                picker.tag = 1
                return picker
            }()
            
            lazy var unityTextField: UITextField = {
                var textField = UITextField(frame: .zero)
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.keyboardType = UIKeyboardType.default
                textField.backgroundColor = .yellow
                textField.clearButtonMode = .whileEditing
                textField.font = .systemFont(ofSize: 15)
                return textField
            }()
            
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
                    
                    unityTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 11),
                    unityTextField.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    unityTextField.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -48),
                    unityTextField.heightAnchor.constraint(equalToConstant: 56),
                    
                    containerConversor.topAnchor.constraint(equalTo: conversorTitle.bottomAnchor, constant: 32),
                    containerConversor.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                    containerConversor.heightAnchor.constraint(equalToConstant: 400),
                    containerConversor.widthAnchor.constraint(equalToConstant: 380),
                    
                    pickerViewBaseInicial.topAnchor.constraint(equalTo: unityTextField.bottomAnchor, constant: 15),
                    pickerViewBaseInicial.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    pickerViewBaseInicial.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -25),
                    pickerViewBaseInicial.heightAnchor.constraint(equalToConstant: 80)

                ]}()
            

            override func viewDidLoad() {
                super.viewDidLoad()
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
                navigationItem.rightBarButtonItem = infoButton
                
                
                collectionCategories.dataSource = self
                collectionCategories.delegate = self
                unityTextField.delegate = self
                
                view.addSubview(ScrollView)
                ScrollView.addSubview(containerView)
                containerView.addSubview(categoriaTitle)
                containerView.addSubview(collectionCategories)
                containerView.addSubview(conversorTitle)
                containerView.addSubview(containerConversor)
                containerConversor.addSubview(questionLabel)
                containerConversor.addSubview(unityTextField)
                containerConversor.addSubview(pickerViewBaseInicial)
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
                //if (sender.tag == 0){
                    let senderTag = sender.tag
                    print(Comprimento.metro.unidadeMedida.nome)
                    getSenderTag(number: senderTag)
                //}
                
               // else if (sender.tag == 1 ){
//                    let senderTag = sender.tag
//                    print(Comprimento.quilometro.unidadeMedida.nome)
//                    getSenderTag(number: senderTag)
               // }
//                else {
//                    print("socorro")
//                }

        }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
               print("TextField did end editing method called")
                let textField = unityTextField.text ?? ""
                let double = Double(textField) ?? 0.0
                print(double)
                getNumber(number: double)
           }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
              textField.resignFirstResponder()
              return true
        }
    
    
        func getSenderTag (number: Int) {
            verificationPicker = number
            pickerViewBaseInicial.reloadAllComponents()
        }
    
}




