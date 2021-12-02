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
    
    private let specific: Placeholder
    
    init(_ specific: Placeholder) {
        self.specific = specific
        super.init(frame: .zero)
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 15, weight: .regular)
        clearButtonMode = .always
        keyboardType = .decimalPad
        placeholder = specific.rawValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
