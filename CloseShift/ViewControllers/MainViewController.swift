//
//  ViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var totalRevenue: UITextField!
    @IBOutlet weak var nonCash: UITextField!
    @IBOutlet weak var expenses: UITextField!
    
    // MARK: - Private properties
    private var xReport = XReport()
    
    // MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        xReport.totalRevenue = getDouble(from: totalRevenue)
        xReport.nonCash = getDouble(from: nonCash)
        xReport.expenses = getDouble(from: expenses)
        
        resultVC.resultDescription = xReport.description
    }
    
    // MARK: - Private methods
    private func getDouble(from textField: UITextField) -> Double {
        guard let nsNumber = NumberFormatter().number(from: textField.text ?? "") else { return 0}
        return Double(truncating: nsNumber)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.tintColor = .systemIndigo
        textField.inputAccessoryView = keyboardToolbar

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )

        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
