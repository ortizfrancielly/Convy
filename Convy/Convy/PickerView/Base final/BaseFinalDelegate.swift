//
//  BaseFinalDelegate.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit

internal class BaseFinalDelegate: NSObject, UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        if verificationPicker == 3 {
        let attributedString = NSAttributedString(string: pickerDataComprimento[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            return attributedString }
        else if verificationPicker == 0 {
            let attributedString = NSAttributedString(string: pickerDataMassa[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
                return attributedString }
        else if verificationPicker == 2 {
            let attributedString = NSAttributedString(string: pickerDataDados[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
                return attributedString
        }
        else {
            let attributedString = NSAttributedString(string: pickerDataTemperatura[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
                return attributedString
        }
}
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            if row == 0 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            else if row == 1 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            
            else if row == 2 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            else if row == 3 && verificationPicker == 3 {
                comparingRowFinal(string2: pickerDataComprimento[row])
            }
            
            else if row == 0 && verificationPicker == 0 {
                comparingRowFinal(string2: pickerDataMassa[row])
            }
            
            else if row == 1 && verificationPicker == 0 {
                comparingRowFinal(string2: pickerDataMassa[row])
            }
            else if row == 2 && verificationPicker == 0 {
                comparingRowFinal(string2: pickerDataMassa[row])
            }
            
            else if row == 3 && verificationPicker == 0 {
                comparingRowFinal(string2: pickerDataMassa[row])
            }
            
            else if row == 0 && verificationPicker == 2 {
                comparingRowFinal(string2: pickerDataDados[row])
            }
            
            else if row == 1 && verificationPicker == 2 {
                comparingRowFinal(string2: pickerDataDados[row])
            }
            else if row == 2 && verificationPicker == 2 {
                comparingRowFinal(string2: pickerDataDados[row])
            }
            
            else if row == 3 && verificationPicker == 2 {
                comparingRowFinal(string2: pickerDataDados[row])
            }
            
            else if row == 0 && verificationPicker == 1 {
                comparingRowFinal(string2: pickerDataTemperatura[row])
            }
            
            else if row == 1 && verificationPicker == 1 {
                comparingRowFinal(string2: pickerDataTemperatura[row])
            }
            else if row == 2 && verificationPicker == 1  {
                comparingRowFinal(string2: pickerDataTemperatura[row])
            }
            else {
                comparingRowFinal(string2: pickerDataTemperatura[row])
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

