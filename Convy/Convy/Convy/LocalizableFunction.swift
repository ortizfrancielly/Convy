//
//  LocalizableFunction.swift
//  Convy
//
//  Created by Francielly Cristina Ortiz Candido on 07/02/22.
//

import Foundation
extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
