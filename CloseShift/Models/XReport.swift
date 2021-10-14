//
//  XReport.swift
//  CloseShift
//
//  Created by Maxim Dukin on 10.10.2021.
//

import Foundation

struct XReport {
    
    // MARK: - Public Properties
    var totalRevenue: Double = 0
    var nonCash: Double = 0
    var expenses: Double = 0
    
    var description: String {
        """
        Дата: \(currentDate)
        Общая выручка: \(separateNumber(totalRevenue))
        Безналичные: \(separateNumber(nonCash))
        Наличные: \(separateNumber(cash))
        
        Расходы: \(separateNumber(expenses))
        Нужно сдать денег: \(separateNumber(cashMinusExpenses))
        """
    }
    
    // MARK: - Private Properties
    private var cash: Double {
        totalRevenue - nonCash
    }
    
    private var cashMinusExpenses: Double {
        cash - expenses
    }
    
    private var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
    // MARK: - Private Methods
    private func separateNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.decimalSeparator = ","
        return numberFormatter.string(from: NSNumber(value: number)) ?? "No a number"
    }
}
