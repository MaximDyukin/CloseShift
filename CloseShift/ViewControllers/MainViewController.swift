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
    
    @IBOutlet weak var firstStack: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Private properties
    private var xReport = XReport()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        
        view.addSubview(nonCashTextField)
        nonCashTextField.delegate = self
        addTF()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        xReport.totalRevenue = getDouble(from: totalRevenue)
        xReport.nonCash = getDouble(from: nonCash)
        xReport.expenses = getDouble(from: expenses)
        
        resultVC.resultDescription = xReport.description
    }
    
    @IBAction func addTextField(_ sender: UIButton) {
        if sender.tag == 0 {
            
        }
    }
    
    // MARK: - Private methods
    private func getDouble(from textField: UITextField) -> Double {
        guard let nsNumber = NumberFormatter().number(from: textField.text ?? "") else { return 0 }
        return Double(truncating: nsNumber)
    }
    
    private func addTF() {
        nonCashTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nonCashTextField.topAnchor.constraint(equalTo: expenses.bottomAnchor, constant: 92),
            nonCashTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nonCashTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    deinit {
        removeKeyboardNotification()
    }
}

// MARK: - Keyboard Notification
extension MainViewController {
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWasShown(notification: Notification) {
        let userInfo = notification.userInfo
        guard let keyboardSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInset
        scrollView.verticalScrollIndicatorInsets = contentInset
    }
    
    @objc private func keyboardWillBeHidden() {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.verticalScrollIndicatorInsets = contentInset
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
