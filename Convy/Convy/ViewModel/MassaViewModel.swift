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
        baseFinal = Comprimento.quilometro.unidadeMedida
    }
    
    func verifiesRowsMassa (InicialText: String, FinalText: String, value: Double) -> Double {
            let viewModel = MassaViewModel()
            var resposta = 0.0

            switch (InicialText) {
                
            case "Grama":
                if InicialText == "Grama" && FinalText == "Quilograma" {
                    viewModel.baseFinal = Massa.quilograma.unidadeMedida
                viewModel.baseInicial = Massa.grama.unidadeMedida
                viewModel.valor = value
                resposta = viewModel.calcular()
                }
                else if InicialText == "Grama" && FinalText == "Miligrama" {
                    viewModel.baseFinal = Massa.miligrama.unidadeMedida
                    viewModel.baseInicial = Massa.grama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Grama" && FinalText == "Grama" {
                    resposta = value
                }
            case "Miligrama":
                if InicialText == "Miligrama" && FinalText == "Quilograma" {
                    viewModel.baseFinal = Massa.quilograma.unidadeMedida
                    viewModel.baseInicial = Massa.miligrama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Miligrama" && FinalText == "Miligrama" {
                    resposta = value
                }
                else if InicialText == "Miligrama" && FinalText == "Grama" {
                    viewModel.baseFinal = Massa.grama.unidadeMedida
                    viewModel.baseInicial = Massa.miligrama.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
            
            case "Quilograma":
                if InicialText == "Quilograma" && FinalText == "Miligrama" {
                    viewModel.baseFinal = Massa.miligrama.unidadeMedida
                    viewModel.baseInicial = Massa.quilograma.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Quilograma" && FinalText == "Quilograma" {
                    resposta = value
                }
                else if InicialText == "Quilograma" && FinalText == "Grama" {
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
