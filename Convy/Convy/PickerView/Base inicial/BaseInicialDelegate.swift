//
//  BaseInicialDelegate.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit

let pickerDataComprimento: [String] = ["Escolha sua base", Comprimento.centimetro.unidadeMedida.nome, Comprimento.quilometro.unidadeMedida.nome, Comprimento.metro.unidadeMedida.nome]

let pickerDataMassa: [String] = ["Escolha sua base", Massa.miligrama.unidadeMedida.nome, Massa.grama.unidadeMedida.nome, Massa.quilograma.unidadeMedida.nome]

let pickerDataDados: [String] = ["Escolha sua base", Dados.kilobyte.unidadeMedida.nome, Dados.megabyte.unidadeMedida.nome, Dados.gigabyte.unidadeMedida.nome]

let pickerDataTemperatura: [String] = ["Escolha sua base", Temperatura.kelvin.unidadeMedidaTemp.nome, Temperatura.celsius.unidadeMedidaTemp.nome, Temperatura.fahrenheit.unidadeMedidaTemp.nome]

internal class BaseInicialDelegate: NSObject, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if verificationPicker == 3 {
        let attributedString = NSAttributedString(string: pickerDataComprimento[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return attributedString }
        else {
            let attributedString = NSAttributedString(string: pickerDataTemperatura[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
                return attributedString }
    }
    

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
            {
                if row == 0 && verificationPicker == 3 {
                    comparingRowInitial(string1: pickerDataComprimento[row])
                }
                else if row == 1 && verificationPicker == 3 {
                    comparingRowInitial(string1: pickerDataComprimento[row])
                }
                else if row == 2 && verificationPicker == 3 {
                    comparingRowInitial(string1: pickerDataComprimento[row])
                }
                else if row == 3 && verificationPicker == 3 {
                    comparingRowInitial(string1: pickerDataComprimento[row])
                }
                
                else if row == 0 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                else if row == 1 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                else if row == 2 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                
                else if row == 3 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                
                else if row == 0 && verificationPicker == 2 {
                    comparingRowInitial(string1: pickerDataDados[row])
                }
                else if row == 1 && verificationPicker == 2 {
                    comparingRowInitial(string1: pickerDataDados[row])
                }
                else if row == 2 && verificationPicker == 2 {
                    comparingRowInitial(string1: pickerDataDados[row])
                }
                
                else if row == 3 && verificationPicker == 2 {
                    comparingRowInitial(string1: pickerDataDados[row])
                }
                
                else if row == 0 && verificationPicker == 1 {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                else if row == 1 && verificationPicker == 1 {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                else if row == 2 && verificationPicker == 1  {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                else {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                
            }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if verificationPicker == 3 {
                return pickerDataComprimento[row]
            }
            else if verificationPicker == 0 {
                return pickerDataMassa[row]
            }
            
            else if verificationPicker == 2 {
                return pickerDataDados[row]
            }
            
            else {
                return pickerDataTemperatura[row]
            }
    }
}
