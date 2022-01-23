//
//  Temperatura.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
enum Temperatura: CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
    
    var unidadeMedidaTemp: UnidadeMedidaTemp {
        switch self {
        case .celsius:
            return UnidadeMedidaTemp(nome: "Celsius")
        case .fahrenheit:
            return UnidadeMedidaTemp(nome: "Fahrenheit")
        case .kelvin:
           return UnidadeMedidaTemp(nome: "Kelvin")
        }
    }
}
