//
//  BaseFinalDelegate.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit

internal class BaseFinalDelegate: NSObject, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            if row == 0 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            
            else if row == 1 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            else if row == 2 {
                comparingRowFinal(string2: pickerDataComprimento[row])
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
