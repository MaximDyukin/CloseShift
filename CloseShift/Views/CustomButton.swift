//
//  CustomButton.swift
//  CloseShift
//
//  Created by Maxim Dukin on 02.12.2021.
//

import UIKit

enum Title: String {
    case calculate = "РАССЧИТАТЬ"
    case addTerminal = "ДОБАВИТЬ ТЕРМИНАЛ"
    case addExpense = "ДОБАВИТЬ РАСХОДЫ"
}

class CustomButton: UIButton {
    
    init(title: Title, action: Selector) {
        super.init(frame: .zero)
        setTitle(title.rawValue, for: .normal)
        setTitleColor(.systemIndigo, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        backgroundColor = .systemBackground
        layer.cornerRadius = 5
        addTarget(nil, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
