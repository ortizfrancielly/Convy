//
//  MassaViewModel.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation

class MassaViewModel: ConversionViewModel {
    
    var valor: Double
    
    let unidadeMedida: [UnidadeMedida]
    
    var baseInicial: UnidadeMedida
    
    var baseFinal: UnidadeMedida
    
    func calcular() -> Double {
        let taxaConversao = baseInicial.base / baseFinal.base
        return valor * taxaConversao
    }
    
    
    init(){
        valor = 0
        unidadeMedida = Massa.allCases.map {$0.unidadeMedida}
        baseInicial = Massa.grama.unidadeMedida
        baseFinal = Massa.quilograma.unidadeMedida
    }
    
    func verifiesRowsMassa (InicialText: String, FinalText: String, value: Double) -> Double {
            let viewModel = MassaViewModel()
            var resposta = 0.0

            switch (InicialText) {
                
            case "Grama".localized():
                if InicialText == "Grama".localized() && FinalText == "Quilograma".localized() {
                    viewModel.baseFinal = Massa.quilograma.unidadeMedida
                viewModel.baseInicial = Massa.grama.unidadeMedida
                viewModel.valor = value
                resposta = viewModel.calcular()
                }
                else if InicialText == "Grama".localized() && FinalText == "Miligrama".localized() {
                    viewModel.baseFinal = Massa.miligrama.unidadeMedida
                    viewModel.baseInicial = Massa.grama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Grama".localized() && FinalText == "Grama".localized() {
                    resposta = value
                }
            case "Miligrama".localized():
                if InicialText == "Miligrama".localized() && FinalText == "Quilograma".localized() {
                    viewModel.baseFinal = Massa.quilograma.unidadeMedida
                    viewModel.baseInicial = Massa.miligrama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Miligrama".localized() && FinalText == "Miligrama".localized() {
                    resposta = value
                }
                else if InicialText == "Miligrama".localized() && FinalText == "Grama".localized() {
                    viewModel.baseFinal = Massa.grama.unidadeMedida
                    viewModel.baseInicial = Massa.miligrama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
            
            case "Quilograma".localized():
                if InicialText == "Quilograma".localized() && FinalText == "Miligrama".localized() {
                    viewModel.baseFinal = Massa.miligrama.unidadeMedida
                    viewModel.baseInicial = Massa.quilograma.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Quilograma".localized() && FinalText == "Quilograma".localized() {
                    resposta = value
                }
                else if InicialText == "Quilograma".localized() && FinalText == "Grama".localized() {
                    viewModel.baseFinal = Massa.grama.unidadeMedida
                    viewModel.baseInicial = Massa.quilograma.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                
            default:
                print ("verificar")
        }
        
            return resposta
    }
}
