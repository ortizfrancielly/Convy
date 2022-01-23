//
//  DadosViewModel.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
class DadosViewModel: ConversionViewModel {
    
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
        unidadeMedida = Dados.allCases.map {$0.unidadeMedida}
        baseInicial = Dados.kilobyte.unidadeMedida
        baseFinal = Dados.megabyte.unidadeMedida
    }
    
        func verifiesRowsDados (InicialText: String, FinalText: String, value: Double) -> Double {
                
                let viewModel = DadosViewModel()
                var resposta = 0.0
 
            switch (InicialText) {
                
            case "Kilobyte":
                if InicialText == "Kilobyte" && FinalText == "Megabyte" {
                viewModel.baseFinal = Dados.megabyte.unidadeMedida
                viewModel.baseInicial = Dados.kilobyte.unidadeMedida
                viewModel.valor = value
                resposta = viewModel.calcular()
                }
                else if InicialText == "Kilobyte" && FinalText == "Gigabyte" {
                    viewModel.baseFinal = Dados.gigabyte.unidadeMedida
                    viewModel.baseInicial = Dados.kilobyte.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Kilobyte" && FinalText == "Kilobyte" {
                    resposta = value
                }
            case "Megabyte":
                if InicialText == "Megabyte" && FinalText == "Kilobyte" {
                    viewModel.baseFinal = Dados.kilobyte.unidadeMedida
                    viewModel.baseInicial = Dados.megabyte.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Megabyte" && FinalText == "Megabyte" {
                    resposta = value
                }
                else if InicialText == "Megabyte" && FinalText == "Gigabyte" {
                    viewModel.baseFinal = Dados.gigabyte.unidadeMedida
                    viewModel.baseInicial = Dados.megabyte.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
            
            case "Gigabyte":
                if InicialText == "Gigabyte" && FinalText == "Kilobyte" {
                    viewModel.baseFinal = Dados.kilobyte.unidadeMedida
                    viewModel.baseInicial = Dados.gigabyte.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                else if InicialText == "Gigabyte" && FinalText == "Gigabyte" {
                    resposta = value
                }
                else if InicialText == "Gigabyte" && FinalText == "Megabyte" {
                    viewModel.baseFinal = Dados.megabyte.unidadeMedida
                    viewModel.baseInicial = Dados.gigabyte.unidadeMedida
                    viewModel.valor = value
                    resposta = viewModel.calcular()
                }
                
            default:
                print ("verificar")
        }
            
                return resposta

    }

}
