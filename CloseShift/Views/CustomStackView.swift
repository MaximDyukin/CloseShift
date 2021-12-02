//
//  CustomStackView.swift
//  CloseShift
//
//  Created by Maxim Dukin on 02.12.2021.
//

import UIKit

class CustomStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .fillEqually
        spacing = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
