//
//  MultiplicationQuestion.swift
//  MultiplicationTables
//
//  Created by Montana Braswell on 8/5/26.
//

import Foundation

struct MultiplicationQuestion {
    
    let num1: Int
    let num2: Int
    
    var displayString: String {
        "\(num1) x \(num2) ="
    }
    
    var answerString: String {
        let answer = num1 * num2
        return String(answer)
    }
}


extension MultiplicationQuestion {
    static func random(table: Int) -> MultiplicationQuestion {
       
        let randomNumber = Int.random(in: 1...12)
        
        return MultiplicationQuestion(num1: randomNumber, num2: table)
    }
}
