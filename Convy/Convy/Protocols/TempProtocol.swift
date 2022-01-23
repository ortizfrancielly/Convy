//
//  TempProtocol.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 23/01/22.
//

import Foundation
import Foundation

protocol TempViewModel {
    var valor: Double {get set}
    var unidadeMedida: [UnidadeMedidaTemp] {get}
    var baseInicial: UnidadeMedidaTemp {get set}
    var baseFinal: UnidadeMedidaTemp {get set}
    
}
