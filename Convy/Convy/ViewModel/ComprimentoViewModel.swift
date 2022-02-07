//
//  ComprimentoViewModel.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 19/01/22.
//

import Foundation

class ComprimentoViewModel: ConversionViewModel {
    
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
        unidadeMedida = Comprimento.allCases.map {$0.unidadeMedida}
        baseInicial = Comprimento.metro.unidadeMedida
        baseFinal = Comprimento.quilometro.unidadeMedida
    }
    
        func verifiesRowsComprimento (InicialText: String, FinalText: String, value: Double) -> Double {
                
                let viewModel = ComprimentoViewModel()
                var resposta = 0.0
 
            switch (InicialText) {
                
            case "Centímetro".localized():
                if InicialText == "Centímetro".localized() && FinalText == "Quilômetro".localized() {
                viewModel.baseFinal = Comprimento.quilometro.unidadeMedida
                viewModel.baseInicial = Comprimento.centimetro.unidadeMedida
                viewModel.valor = value
                resposta = viewModel.calcular()
                }
                else if InicialText == "Centímetro".localized() && FinalText == "Metro".localized() {
                    viewModel.baseFinal = Comprimento.metro.unidadeMedida
                    viewModel.baseInicial = Comprimento.centimetro.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Centímetro".localized() && FinalText == "Centímetro".localized() {
                    resposta = value
                }
            case "Metro".localized():
                if InicialText == "Metro".localized() && FinalText == "Centímetro".localized() {
                    viewModel.baseFinal = Comprimento.centimetro.unidadeMedida
                    viewModel.baseInicial = Comprimento.metro.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Metro".localized() && FinalText == "Metro".localized() {
                    resposta = value
                }
                else if InicialText == "Metro".localized() && FinalText == "Quilômetro".localized() {
                    viewModel.baseFinal = Comprimento.quilometro.unidadeMedida
                    viewModel.baseInicial = Comprimento.metro.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
            
            case "Quilômetro".localized():
                if InicialText == "Quilômetro".localized() && FinalText == "Centímetro".localized() {
                    viewModel.baseFinal = Comprimento.centimetro.unidadeMedida
                    viewModel.baseInicial = Comprimento.quilometro.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Quilômetro".localized() && FinalText == "Quilômetro".localized() {
                    resposta = value
                }
                else if InicialText == "Quilômetro".localized() && FinalText == "Metro".localized() {
                    viewModel.baseFinal = Comprimento.metro.unidadeMedida
                    viewModel.baseInicial = Comprimento.quilometro.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                
            default:
                print ("verificar")
        }
            
                return resposta

    }

}
