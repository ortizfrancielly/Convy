//
//  TemperaturaViewModel.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
import Foundation
class TemperaturaViewModel: TempViewModel {
    
    var valor: Double
    
    let unidadeMedida: [UnidadeMedidaTemp]
    
    var baseInicial: UnidadeMedidaTemp
    
    var baseFinal: UnidadeMedidaTemp
    
    
    
    init(){
        valor = 0
        unidadeMedida = Temperatura.allCases.map {$0.unidadeMedidaTemp}
        baseInicial = Temperatura.celsius.unidadeMedidaTemp
        baseFinal = Temperatura.kelvin.unidadeMedidaTemp
    }
    
    func verifiesRowsTemp (InicialText: String, FinalText: String, value: Double) -> Double {
        let viewModel = TemperaturaViewModel()
        var resposta = 0.0
        
        switch (InicialText) {
            
        case "Celsius":
            if InicialText == "Celsius" && FinalText == "Fahrenheit" {
                viewModel.valor = value
                resposta = round((viewModel.valor * 1.8) + 32)
            }
            else if InicialText == "Celsius" && FinalText == "Kelvin" {
                viewModel.valor = value
                resposta = round(viewModel.valor + 273)
            }
            else if InicialText == "Celsius" && FinalText == "Celsius" {
                resposta = value
            }
        case "Fahrenheit":
            if InicialText == "Fahrenheit" && FinalText == "Celsius" {
                viewModel.valor = value
                resposta = round((viewModel.valor - 32) + 1.8)
            }
            else if InicialText == "Fahrenheit" && FinalText == "Fahrenheit" {
                resposta = value
            }
            else if InicialText == "Fahrenheit" && FinalText == "Kelvin" {
                viewModel.valor = value
                resposta = round((((viewModel.valor - 32) * 5)/9) + 273)
            }
        
        case "Kelvin":
            if InicialText == "Kelvin" && FinalText == "Celsius" {
                viewModel.valor = value
                resposta = round(viewModel.valor - 273)
            }
            else if InicialText == "Kelvin" && FinalText == "Kelvin" {
                resposta = value
            }
            else if InicialText == "Kelvin" && FinalText == "Fahrenheit" {
                viewModel.valor = value
                resposta = round(((viewModel.valor - 273) * 1.8) + 32)
            }
            
        default:
            print ("verificar")
    }
        return resposta
    }
}
