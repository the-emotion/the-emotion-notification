//
//  File.swift
//  
//
//  Created by MikhailSeregin on 25.05.2022.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
    
    /// Возвращает значение строки для текущей локали модуля
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .module,
            value: "**\(self)**",
            comment: ""
        )
    }
}
