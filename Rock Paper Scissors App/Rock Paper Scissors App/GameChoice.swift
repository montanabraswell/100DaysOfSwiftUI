//
//  GameChoice.swift
//  Rock Paper Scissors App
//
//  Created by Ahava Morse on 6/15/26.
//

import Foundation

enum GameChoice: String, CaseIterable {
    case rock
    case paper
    case scissors
    
    var displayValue: String {
        switch self {
        case .rock: "Rock"
        case .paper: "Paper"
        case .scissors: "Scissors"
        }
    }
}
