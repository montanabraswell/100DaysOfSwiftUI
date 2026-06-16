//
//  RockPaperScissorsViewModel.swift
//  Rock Paper Scissors App
//
//  Created by Ahava Morse on 6/15/26.
//

import Foundation

@Observable
class RockPaperScissorsViewModel {
    var playerScore = 0
    // keep track of what computer randomly picked
    var computerGameChoice: GameChoice = .rock
    var playerShouldWin = false
    var isShowingGameOverAlert = false
    
    // Keep track of questions til we get to 10
    private var numOfAnsweredQuestions = 0
    
    func playerDidChoose(_ choice: GameChoice) {
        let playerWasCorrect = checkAnswer(choice)
        updateScore(playerWasCorrect: playerWasCorrect)
        
        // update number of questions that have been answered
        numOfAnsweredQuestions += 1
        checkIfGameIsOver()
        
        playerShouldWin.toggle()
        getComputerChoice()
    }
    
    func resetGame() {
        playerScore = 0
        numOfAnsweredQuestions = 0
    }
    
    private func getComputerChoice() {
        computerGameChoice = GameChoice.allCases.randomElement() ?? .rock
    }
    
    private func checkIfGameIsOver() {
        if numOfAnsweredQuestions == 10 {
            print("Game Over")
            isShowingGameOverAlert = true
        } else {
            print("Game is not over because you only answered \(numOfAnsweredQuestions)")
        }
    }
    
    private func checkAnswer(_ choice: GameChoice) -> Bool {
        // compare player choice and computer game choice
        // compare case and check if its correct
        
        let correctChoice: GameChoice
        
        switch computerGameChoice {
        case .rock:
            if playerShouldWin {
                correctChoice = .paper
            } else {
                correctChoice = .scissors
            }
        case .paper:
            if playerShouldWin {
                correctChoice = .scissors
            } else {
                correctChoice = .rock
            }
        case .scissors:
            if playerShouldWin {
                correctChoice = .rock
            } else {
                correctChoice = .paper
            }
        }
        
        let didPlayerWin = (correctChoice == choice)
        return didPlayerWin == playerShouldWin
    }
    
    private func updateScore(playerWasCorrect: Bool) {
        // if correct, plus one to the score
        // if incorrect minus one to the score
        // compare if did player win and should they win
        if playerWasCorrect {
            playerScore += 1
        } else {
            playerScore -= 1
        }
    }
}
