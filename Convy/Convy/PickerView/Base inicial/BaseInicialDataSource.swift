//
//  BaseInicialDataSource.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 20/01/22.
//

import Foundation
import UIKit


internal class BaseInicialDataSource: NSObject, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Comprimento.allCases.count
    }
    
    
}
