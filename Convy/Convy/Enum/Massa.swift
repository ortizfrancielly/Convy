//
//  Massa.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
enum Massa: CaseIterable {
    case grama
    case miligrama
    case quilograma
    
    var unidadeMedida: UnidadeMedida {
        switch self {
        case .miligrama:
            return UnidadeMedida(nome: "Miligrama".localized(), base: 0.01)
        case .grama:
            return UnidadeMedida(nome: "Grama".localized(), base: 1)
        case .quilograma:
            return UnidadeMedida(nome: "Quilograma".localized(), base: 1000)
        }
    }
}
