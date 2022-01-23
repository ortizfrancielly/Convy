//
//  Dados.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
enum Dados: CaseIterable {
    case kilobyte
    case megabyte
    case gigabyte
    
    var unidadeMedida: UnidadeMedida {
        switch self {
        case .kilobyte:
            return UnidadeMedida(nome: "Kilobyte", base: 0.00097656)
        case .megabyte:
            return UnidadeMedida(nome: "Megabyte", base: 1)
        case .gigabyte:
           return UnidadeMedida(nome: "Gigabyte", base: 1024)
        }
    }
}
