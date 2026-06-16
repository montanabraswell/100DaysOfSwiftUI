//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI

@Observable
class RockPaperScissorsViewModel {
    var playerScore = 0
    // Keep track of questions til we get to 10
    var numOfAnsweredQuestions = 0
    // keep track of what computer randomly picked
    var computerGameChoice: GameChoice = .rock
    var playerShouldWin = false
    var isShowingGameOverAlert = false
}

struct RockPaperScissorsView: View {  // opens struct
    
    @State private var viewModel = RockPaperScissorsViewModel()

    var body: some View {  // opens body
        VStack {  // opens VStack
            Text("RPS Simulator")
                .padding(.vertical)
            
            Text("Your opponent chose: \(viewModel.computerGameChoice.displayValue).")
            
            Text("Your goal is to : \(viewModel.playerShouldWin ? " Win " : "Lose ")")
            
            Text("Which should you choose?")
                .padding(.vertical)
            
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    playerDidChoose(choice)
                }  // closes button action
            }
            
            Text("Score: \(viewModel.playerScore)")
                .padding()
                .alert("Game Over!\nFinal score is: \(viewModel.playerScore)", isPresented: $viewModel.isShowingGameOverAlert) {
                    Button("Restart") {
                        resetGame()
                    }
                }
        }  // closes VStack
    }  // closes body
    
    private func playerDidChoose(_ choice: GameChoice) {
        let playerWasCorrect = checkAnswer(choice)
        updateScore(playerWasCorrect: playerWasCorrect)
        
        // update number of questions that have been answered
        viewModel.numOfAnsweredQuestions += 1
        checkIfGameIsOver()
        
        viewModel.playerShouldWin.toggle()
        getComputerChoice()
    }
    
    func getComputerChoice() {     // opens function
        viewModel.computerGameChoice = GameChoice.allCases.randomElement() ?? .rock
    }
    
    func checkIfGameIsOver() {
        // if game is over
        if viewModel.numOfAnsweredQuestions == 10 {
            print("Game Over")
            viewModel.isShowingGameOverAlert = true
        } else {
            print("Game is not over because you only answered \(viewModel.numOfAnsweredQuestions)")
        }
    }
    
    func resetGame() {
        viewModel.playerScore = 0
        viewModel.numOfAnsweredQuestions = 0
    }
    
    private func checkAnswer(_ choice: GameChoice) -> Bool {
        // compare player choice and computer game choice
        // compare case and check if its correct
        
        let correctChoice: GameChoice
        
        switch viewModel.computerGameChoice {
        case .rock:
            if viewModel.playerShouldWin {
                correctChoice = .paper
            } else {
                correctChoice = .scissors
            }
        case .paper:
            if viewModel.playerShouldWin {
                correctChoice = .scissors
            } else {
                correctChoice = .rock
            }
        case .scissors:
            if viewModel.playerShouldWin {
                correctChoice = .rock
            } else {
                correctChoice = .paper
            }
        }
        
        let didPlayerWin = (correctChoice == choice)
        return didPlayerWin == viewModel.playerShouldWin
    }
    
    private func updateScore(playerWasCorrect: Bool) {
        // if correct, plus one to the score
        // if incorrect minus one to the score
        // compare if did player win and should they win
        if playerWasCorrect {
            viewModel.playerScore += 1
        } else {
            viewModel.playerScore -= 1
        }
    }
}  // closes struct

#Preview {  // opens preview
    RockPaperScissorsView()
}  // closes preview
