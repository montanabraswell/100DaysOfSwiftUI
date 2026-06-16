//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI

struct RockPaperScissorsView: View {  // opens struct
   
       @State private var playerScore = 0
       // Keep track of questions til we get to 10
       @State private var numOfAnsweredQuestions = 0
       // keep track of what computer randomly picked
       @State private var computerGameChoice: GameChoice = .rock
       @State private var playerShouldWin = false
       @State private var isShowingGameOverAlert = false

    var body: some View {  // opens body
        VStack {  // opens VStack
            Text("RPS Simulator")
                .padding(.vertical)
            
            Text("Your opponent chose: \(computerGameChoice.displayValue).")
            
            Text("Your goal is to : \(playerShouldWin ? " Win " : "Lose ")")
            
            Text("Which should you choose?")
                .padding(.vertical)
            
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    playerDidChoose(choice)
                }  // closes button action
            }
            
            Text("Score: \(playerScore)")
                .padding()
                .alert("Game Over!\nFinal score is: \(playerScore)", isPresented: $isShowingGameOverAlert) {
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
        numOfAnsweredQuestions += 1
        checkIfGameIsOver()
        
        playerShouldWin.toggle()
        getComputerChoice()
    }
    
    func getComputerChoice() {     // opens function
        computerGameChoice = GameChoice.allCases.randomElement() ?? .rock
    }
    
    func checkIfGameIsOver() {
        // if game is over
        if numOfAnsweredQuestions == 10 {
            print("Game Over")
            isShowingGameOverAlert = true
        } else {
            print("Game is not over because you only answered \(numOfAnsweredQuestions)")
        }
    }
    
    func resetGame() {
        playerScore = 0
        numOfAnsweredQuestions = 0
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
}  // closes struct

#Preview {  // opens preview
    ContentView()
}  // closes preview
