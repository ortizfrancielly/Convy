//
//  BaseInicialDelegate.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit

let pickerDataComprimento: [String] = [Comprimento.centimetro.unidadeMedida.nome, Comprimento.quilometro.unidadeMedida.nome, Comprimento.metro.unidadeMedida.nome]

let pickerDataMassa: [String] = [Massa.miligrama.unidadeMedida.nome, Massa.grama.unidadeMedida.nome, Massa.quilograma.unidadeMedida.nome]

let pickerDataDados: [String] = [Dados.kilobyte.unidadeMedida.nome, Dados.megabyte.unidadeMedida.nome, Dados.gigabyte.unidadeMedida.nome]

let pickerDataTemperatura: [String] = [Temperatura.kelvin.unidadeMedidaTemp.nome, Temperatura.celsius.unidadeMedidaTemp.nome, Temperatura.fahrenheit.unidadeMedidaTemp.nome]

internal class BaseInicialDelegate: NSObject, UIPickerViewDelegate {
    
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
                
                else if row == 0 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                else if row == 1 && verificationPicker == 0 {
                    comparingRowInitial(string1: pickerDataMassa[row])
                }
                else if row == 2 && verificationPicker == 0 {
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
                
                else if row == 0 && verificationPicker == 1 {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                else if row == 1 && verificationPicker == 1 {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                else if row == 2 && verificationPicker == 1 {
                    comparingRowInitial(string1: pickerDataTemperatura[row])
                }
                
                else {
                    print("selecionou a x")
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
