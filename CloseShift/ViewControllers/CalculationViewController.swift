//
//  CalculationViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import UIKit

class CalculationViewController: UIViewController {
    
    private let revenueTextField = CustomTextField(specificPlaceholder: .revenue)
    
    let nonCashStack = UIStackView(arrangedSubviews: [
        CustomTextField(specificPlaceholder: .nonCash),
        CustomTextField(specificPlaceholder: .nonCash),
    ])
    
    private let expensesTextField = CustomTextField(specificPlaceholder: .expenses)
    
    private let buttonAdd: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.tintColor = .systemIndigo
        button.addTarget(self, action: #selector(addTF), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupSubviews(revenueTextField, buttonAdd, nonCashStack)
        nonCashStack.spacing = 8
        nonCashStack.axis = .vertical
        setConstraints()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        revenueTextField.translatesAutoresizingMaskIntoConstraints = false
        revenueTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        revenueTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        revenueTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.topAnchor.constraint(equalTo: revenueTextField.bottomAnchor, constant: 16).isActive = true
        buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nonCashStack.translatesAutoresizingMaskIntoConstraints = false
        nonCashStack.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 16).isActive = true
        nonCashStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nonCashStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func addTF() {
        UIView.animate(withDuration: 0.2) {
            self.nonCashStack.transform = self.nonCashStack.transform.translatedBy(x: 0, y: 50)
        }
    }
}

