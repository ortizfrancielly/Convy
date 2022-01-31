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

func comparingRowInitial (string1: String) {
    stringTextInitial = string1
}


func comparingRowFinal (string2: String) {
    stringTextFinal = string2
}

var stringTextInitial = String()
var stringTextFinal = String()

var verificationPicker = 0

var inputUser = 0.0

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    
    
            var accessoryDoneButton: UIBarButtonItem!
            let accessoryToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    
            var viewModelComprimento = ComprimentoViewModel()
            var viewModelMassa = MassaViewModel()
            var viewModelDados = DadosViewModel()
            var viewModelTemp = TemperaturaViewModel()
    
            var cellId = "cell"
            
            var categories = ["Massa", "Temperatura", "Dados", "Comprimento"]
        
    
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
    
            private let baseFinalDelegate = BaseFinalDelegate()
            private let baseFinalDataSource = BaseFinalDataSource()
            private lazy var pickerViewBaseFinal: UIPickerView = {
                let picker = UIPickerView()
                picker.translatesAutoresizingMaskIntoConstraints = false
                picker.dataSource = baseFinalDataSource
                picker.delegate = baseFinalDelegate
                picker.tag = 1
                return picker
            }()
            
            private lazy var calcButton: UIButton = {
                var button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(calculateButton(_:)), for: .touchUpInside)
                button.backgroundColor = .yellowButton
                button.setTitle("Converter", for: UIControl.State.normal)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
                button.layer.cornerRadius = 14.0
                return button
            }()
            
            
            lazy var unityTextField: UITextField = {
                var textField = UITextField(frame: .zero)
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.keyboardType = UIKeyboardType.default
                textField.backgroundColor = .textFieldColor
                textField.layer.cornerRadius = 7.0
                textField.clearButtonMode = .whileEditing
                textField.font = .systemFont(ofSize: 15)
                textField.textColor = .black
                return textField
            }()
            
            lazy var collectionCategories: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collection.translatesAutoresizingMaskIntoConstraints = false
                collection.register(cellCategories.self, forCellWithReuseIdentifier: cellId)
                layout.itemSize = CGSize(width: 100, height: 105)
                collection.backgroundColor = .white
                return collection
            }()
            
            
            lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
            
            lazy var ScrollView: UIScrollView = {
                let view = UIScrollView(frame: .zero)
                view.backgroundColor = .white
                view.contentSize = contentViewSize
                view.frame = self.view.bounds
                return view
            }()
    
            lazy var resultadoTitle: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .headline)
                label.adjustsFontForContentSizeCategory = true
                label.text = "Resultado"
                label.textColor = .black
                return label
            }()
            
            lazy var categoriaTitle: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .largeTitle)
                label.adjustsFontForContentSizeCategory = true
                label.text = "Categorias"
                label.textColor = .black
                return label
            }()
            
            lazy var baseInicialTitle: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .headline)
                label.adjustsFontForContentSizeCategory = true
                label.text = "Base Inicial"
                label.textColor = .black
                return label
            }()
                
    
            lazy var baseFinalTitle: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .headline)
                label.adjustsFontForContentSizeCategory = true
                label.textColor = .black
                label.text = "Base Final"
                return label
            }()
    
    
            lazy var questionLabel: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .headline)
                label.adjustsFontForContentSizeCategory = true
                label.text = "Qual valor você quer converter?"
                label.textColor = .black
                return label
            }()
            
            lazy var respostaLabel: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .headline)
                label.textColor = .black
                label.adjustsFontForContentSizeCategory = true
                return label
            }()
            lazy var conversorTitle: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .preferredFont(forTextStyle: .largeTitle)
                label.adjustsFontForContentSizeCategory = true
                label.textColor = .black
                label.text = "Conversão"
                return label
            }()
            
            lazy var containerView: UIView = {
                let view = UIView()
                view.frame.size = contentViewSize
                return view
            }()
            
            lazy var containerConversor: UIView = {
                let view = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .grayCard
                view.layer.cornerRadius = 14.0
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
                    unityTextField.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -25),
                    unityTextField.heightAnchor.constraint(equalToConstant: 56),
                    
                    containerConversor.topAnchor.constraint(equalTo: conversorTitle.bottomAnchor, constant: 32),
                    containerConversor.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                    containerConversor.heightAnchor.constraint(equalToConstant: 600),
                    containerConversor.widthAnchor.constraint(equalToConstant: 350),
                    
                    baseInicialTitle.topAnchor.constraint(equalTo: unityTextField.bottomAnchor, constant: 20),
                    baseInicialTitle.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    
                    pickerViewBaseInicial.topAnchor.constraint(equalTo: baseInicialTitle.bottomAnchor, constant: 15),
                    pickerViewBaseInicial.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    pickerViewBaseInicial.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -25),
                    pickerViewBaseInicial.heightAnchor.constraint(equalToConstant: 80),
                    
                    baseFinalTitle.topAnchor.constraint(equalTo: pickerViewBaseInicial.bottomAnchor, constant: 12),
                    baseFinalTitle.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    
                    pickerViewBaseFinal.topAnchor.constraint(equalTo: baseFinalTitle.bottomAnchor, constant: 15),
                    pickerViewBaseFinal.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    pickerViewBaseFinal.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -25),
                    pickerViewBaseFinal.heightAnchor.constraint(equalToConstant: 80),
                    
                    calcButton.topAnchor.constraint(equalTo: pickerViewBaseFinal.bottomAnchor, constant: 40),
                    calcButton.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 50),
                    calcButton.trailingAnchor.constraint(equalTo: containerConversor.trailingAnchor, constant: -50),
                    calcButton.heightAnchor.constraint(equalToConstant: 56),
                    
                    resultadoTitle.topAnchor.constraint(equalTo: calcButton.bottomAnchor, constant: 30),
                    resultadoTitle.leadingAnchor.constraint(equalTo: containerConversor.leadingAnchor, constant: 25),
                    
                    respostaLabel.topAnchor.constraint(equalTo: resultadoTitle.bottomAnchor, constant: 26),
                    respostaLabel.centerXAnchor.constraint(equalTo: containerConversor.centerXAnchor)

                ]}()
            

            override func viewDidLoad() {
                super.viewDidLoad()
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                navigationController?.navigationBar.scrollEdgeAppearance = appearance

                
                
                self.accessoryDoneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.donePressed))
                self.accessoryToolBar.items = [self.accessoryDoneButton]
                self.unityTextField.inputAccessoryView = self.accessoryToolBar
                
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
                containerConversor.addSubview(baseInicialTitle)
                containerConversor.addSubview(pickerViewBaseInicial)
                containerConversor.addSubview(baseFinalTitle)
                containerConversor.addSubview(pickerViewBaseFinal)
                containerConversor.addSubview(calcButton)
                containerConversor.addSubview(resultadoTitle)
                containerConversor.addSubview(respostaLabel)
                collectionCategories.frame = view.bounds
                // Do any additional setup after loading the view.
            }
            
            internal override func viewDidLayoutSubviews() {
                NSLayoutConstraint.activate(constraints)
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
                    let senderTag = sender.tag
                    getSenderTag(number: senderTag)
                }
                
                else if (sender.tag == 1 ){
                    let senderTag = sender.tag
                    getSenderTag(number: senderTag)
                }
                else  if (sender.tag == 2){
                    let senderTag = sender.tag
                    getSenderTag(number: senderTag)
                }
                else {
                    let senderTag = sender.tag
                    getSenderTag(number: senderTag)
                }

        }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
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
            pickerViewBaseFinal.reloadAllComponents()
        }
    
        func getNumber (number: Double) {
            inputUser = number
        }
    
        @objc func donePressed() {
            view.endEditing(true)
        }
    
        @objc func calculateButton(_ sender: UIButton){
            if verificationPicker == 3 {
                let resultadoFinal = viewModelComprimento.verifiesRowsComprimento(InicialText: stringTextInitial, FinalText: stringTextFinal, value: inputUser)
                respostaLabel.text = String(resultadoFinal)
            }
            else if verificationPicker == 0 {
                let resultadoFinal = viewModelMassa.verifiesRowsMassa(InicialText: stringTextInitial, FinalText: stringTextFinal, value: inputUser)
                respostaLabel.text = String(resultadoFinal)
            }

            else if verificationPicker == 2 {
                let resultadoFinal = viewModelDados.verifiesRowsDados(InicialText: stringTextInitial, FinalText: stringTextFinal, value: inputUser)
                respostaLabel.text = String(resultadoFinal)
            }
            
            else {
                let resultadoFinal = viewModelTemp.verifiesRowsTemp(InicialText: stringTextInitial, FinalText: stringTextFinal, value: inputUser)
                respostaLabel.text = String(resultadoFinal)
            }
        }
    
}




