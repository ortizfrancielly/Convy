//
//  Comprimento.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 19/01/22.
//

import Foundation

enum Comprimento: CaseIterable {
    case centimetro
    case metro
    case quilometro
    
    var unidadeMedida: UnidadeMedida {
        switch self {
        case .centimetro:
            return UnidadeMedida(nome: "Centímetro", base: 0.01)
        case .metro:
            return UnidadeMedida(nome: "Metro", base: 1)
        case .quilometro:
           return UnidadeMedida(nome: "Quilômetro", base: 1000)
        }
    }
}
