//
//  CalculationViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import UIKit

class CalculationViewController: UIViewController {
    
    // MARK: - Private properties
    private let stackNonCash = CustomStackView(arrangedSubviews: [
        CustomTextField(.revenue),
        CustomTextField(.nonCash)
    ])
    
    private let expensesStack = CustomStackView(arrangedSubviews: [
        CustomButton(title: .addTerminal, action: #selector(addTerminal)),
        CustomTextField(.expenses)
    ])
    
    private let buttonsStack = CustomStackView(arrangedSubviews: [
        CustomButton(title: .addExpense, action: #selector(addExpenses)),
        CustomButton(title: .calculate, action: #selector(calculate))
    ])
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupSubviews(stackNonCash, expensesStack, buttonsStack)
        setConstraintsForStackNonCash()
        setConstraintsForExpensesStack()
        setConstraintsForButtonsStack()
    }
    
    // MARK: - Private func
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraintsForStackNonCash() {
        stackNonCash.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackNonCash.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackNonCash.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackNonCash.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setConstraintsForExpensesStack() {
        expensesStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expensesStack.topAnchor.constraint(equalTo: stackNonCash.bottomAnchor, constant: 8),
            expensesStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            expensesStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setConstraintsForButtonsStack() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: expensesStack.bottomAnchor, constant: 8),
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Actions of buttons
    @objc private func addTerminal() {
        expensesStack.transform = expensesStack.transform.translatedBy(x: 0, y: -42)
        buttonsStack.transform = buttonsStack.transform.translatedBy(x: 0, y: -42)
        
        UIView.animate(withDuration: 0.4) {
            self.stackNonCash.addArrangedSubview(CustomTextField(.nonCash))
            self.expensesStack.transform = self.expensesStack.transform.translatedBy(x: 0, y: 42)
            self.buttonsStack.transform = self.buttonsStack.transform.translatedBy(x: 0, y: 42)
        }
    }
    
    @objc private func addExpenses() {
        buttonsStack.transform = buttonsStack.transform.translatedBy(x: 0, y: -42)

        UIView.animate(withDuration: 0.4) {
            self.expensesStack.addArrangedSubview(CustomTextField(.expenses))
            self.buttonsStack.transform = self.buttonsStack.transform.translatedBy(x: 0, y: 42)
        }
    }
    
    @objc private func calculate() {
        let resultVC = ResultViewController()
        present(resultVC, animated: true)
    }
}
