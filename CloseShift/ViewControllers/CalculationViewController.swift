//
//  CalculationViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import UIKit

class CalculationViewController: UIViewController {
    
    // MARK: - Private properties
    private let revenueAndNonCashTF = CustomStackView(arrangedSubviews: [
        CustomTextField(.revenue),
        CustomTextField(.nonCash)
    ])
    
    private let expensesStack = CustomStackView(arrangedSubviews: [
        CustomButton(title: .addTerminal, action: #selector(addTerminal)),
        CustomTextField(.expenses)
    ])
    
    private let expensesAndCalculateButtonsStack = CustomStackView(arrangedSubviews: [
        CustomButton(title: .addExpense, action: #selector(addExpenses)),
        CustomButton(title: .calculate, action: #selector(calculate))
    ])
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupSubviews(revenueAndNonCashTF, expensesStack, expensesAndCalculateButtonsStack)
        setConstraints()
    }
    
    // MARK: - Private func
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        revenueAndNonCashTF.translatesAutoresizingMaskIntoConstraints = false
        revenueAndNonCashTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        revenueAndNonCashTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        revenueAndNonCashTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        expensesStack.translatesAutoresizingMaskIntoConstraints = false
        expensesStack.topAnchor.constraint(equalTo: revenueAndNonCashTF.bottomAnchor, constant: 8).isActive = true
        expensesStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        expensesStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        expensesAndCalculateButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        expensesAndCalculateButtonsStack.topAnchor.constraint(equalTo: expensesStack.bottomAnchor, constant: 8).isActive = true
        expensesAndCalculateButtonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        expensesAndCalculateButtonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func addTerminal() {
        revenueAndNonCashTF.addArrangedSubview(CustomTextField(.nonCash))
    }
    
    @objc private func addExpenses() {
        expensesStack.addArrangedSubview(CustomTextField(.expenses))
    }
    
    @objc private func calculate() {
        
    }
}

