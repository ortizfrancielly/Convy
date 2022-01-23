//
//  ComprimentoProtocol.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 19/01/22.
//

import Foundation

protocol ConversionViewModel {
    var valor: Double {get set}
    var unidadeMedida: [UnidadeMedida] {get}
    var baseInicial: UnidadeMedida {get set}
    var baseFinal: UnidadeMedida {get set}
    
    func calcular() -> Double
}
