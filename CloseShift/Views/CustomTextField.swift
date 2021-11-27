//
//  CustomTextField.swift
//  CloseShift
//
//  Created by Maxim Dukin on 26.11.2021.
//

import UIKit

enum Placeholder: String {
    case revenue = "Выручка"
    case nonCash = "Безналичные"
    case expenses = "Расходы"
}

class CustomTextField: UITextField {
    private let specificPlaceholder: Placeholder
    
    init(specificPlaceholder: Placeholder) {
        self.specificPlaceholder = specificPlaceholder
        super.init(frame: .zero)
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 15, weight: .regular)
        clearButtonMode = .always
        keyboardType = .decimalPad
        placeholder = specificPlaceholder.rawValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
