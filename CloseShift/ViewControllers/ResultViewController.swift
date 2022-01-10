//
//  ResultViewController.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.01.2022.
//

import UIKit

class ResultViewController: UIViewController {
    // попробовать без lazy
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .close)
        
        button.tintColor = .systemIndigo
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupSubviews(cancelButton)
        setConstraintsForCancelButton()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraintsForCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
