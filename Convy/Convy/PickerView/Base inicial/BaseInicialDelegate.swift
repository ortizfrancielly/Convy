//
//  BaseInicialDelegate.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit

let pickerData: [String] = [Comprimento.centimetro.unidadeMedida.nome, Comprimento.quilometro.unidadeMedida.nome, Comprimento.metro.unidadeMedida.nome]

internal class BaseInicialDelegate: NSObject, UIPickerViewDelegate {
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
            {
                if row == 0 {
                    print("selecionou a zero")
                }
                else if row == 1 {
                    print("selecionou a 1")
                }
                else {
                    print("selecionou a 2")
                }
            }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if verificationPicker == 1 {
                return pickerData[row]
            }
            else if verificationPicker == 0 {
                return Comprimento.quilometro.unidadeMedida.nome

            }
            
            else {
                return Comprimento.centimetro.unidadeMedida.nome
            }
    }
}
