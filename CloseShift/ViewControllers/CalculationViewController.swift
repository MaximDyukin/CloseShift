//
//  CalculationViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import UIKit

class CalculationViewController: UIViewController {
    
    private let nonCashTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.clearButtonMode = .always
        textField.keyboardType = .decimalPad
        textField.placeholder = "Безналичные"
        return textField
    }()

    private let expensesTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.clearButtonMode = .always
        textField.keyboardType = .decimalPad
        textField.placeholder = "Расходы"
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupSubviews(nonCashTextField)
        setConstraints()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        nonCashTextField.translatesAutoresizingMaskIntoConstraints = false
        nonCashTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        nonCashTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nonCashTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
}

