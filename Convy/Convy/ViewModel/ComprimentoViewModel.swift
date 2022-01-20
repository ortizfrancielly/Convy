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
    
    
}
