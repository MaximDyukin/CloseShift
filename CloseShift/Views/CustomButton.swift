//
//  CustomButton.swift
//  CloseShift
//
//  Created by Maxim Dukin on 02.12.2021.
//

import UIKit

class CustomButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setTitle("РАССЧИТАТЬ", for: .normal)
        setTitleColor(.systemIndigo, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        backgroundColor = .systemBackground
        layer.cornerRadius = 5
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
