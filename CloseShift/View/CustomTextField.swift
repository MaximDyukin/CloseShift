//
//  CustomTextField.swift
//  CloseShift
//
//  Created by Maxim Dukin on 23.11.2021.
//

import UIKit

let nonCashTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.font = .systemFont(ofSize: 15, weight: .regular)
    textField.clearButtonMode = .always
    textField.keyboardType = .decimalPad
    textField.placeholder = "Безналичные"
    return textField
}()

let expensesTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.font = .systemFont(ofSize: 15, weight: .regular)
    textField.clearButtonMode = .always
    textField.keyboardType = .decimalPad
    textField.placeholder = "Расходы"
    return textField
}()
