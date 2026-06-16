//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI

struct ContentView: View {  // opens struct
   
       @State private var playerScore = 0
       @State private var correctAnswer = Int.random(in: 0...2)
       // Keep track of questions til we get to 10
       @State private var numOfAnsweredQuestions = 0
       // keep track of what player picked
       @State private var playerChoice: GameChoice = .rock
       // keep track of what computer randomly picked
       @State private var computerGameChoice: GameChoice = .rock
       @State private var playerShouldWin = false
       @State private var isShowingGameOverAlert = false
       @State private var gameOverAlertTitle = ""
       @State private var showFinalScoreAlertMessage = ""



    var body: some View {  // opens body
        VStack {  // opens VStack
            Text("RPS Simulator")
                .padding(.vertical)
            
            Text("Your opponent chose: \(computerGameChoice.displayValue).") // TODO update this to when someone clicks what should show which variable same to line 45
            
            Text("Your goal is to : \(playerShouldWin ? " Win " : "Lose ")") // TODO
            
            Text("Which should you choose?")
                .padding(.vertical)
            
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    playerChoice = choice
                    checkAnswer()
                    
                    // update number of questions that have been answered
                    numOfAnsweredQuestions += 1
                    checkIfGameIsOver()
                    
                    getComputerChoice()
                    
                    
                }  // closes button action
            
            }
                Text("Score: \(playerScore)")
                .padding()
            
            
            // make an alert and connect it with the boolean
                .alert("Game Over!\nFinal score is: \(playerScore)", isPresented: $isShowingGameOverAlert) {
                    Button("Restart") {
                        resetGame()
                    }
                }
          
            
        }  // closes VStack

    }  // closes body

    
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
    
    func checkAnswer() {
        // compare player choice and computer game choice
        // compare case and check if its correct
        // if correct, plus one to the score
        // if incorrect minus one to the score
        // compare if did player win and should they win
    
        var didPlayerWin: Bool
        let correctChoice: GameChoice
        
        switch computerGameChoice {
        case .rock:
            //copy teh rest to paper and scissors then uncomments line 97 to 101
            if playerShouldWin {
                correctChoice = .paper
            } else {
                correctChoice = .scissors
            }
            didPlayerWin = (correctChoice == playerChoice)
            
        case .paper:
            //
            if playerShouldWin {
                correctChoice = .scissors
            } else {
                correctChoice = .rock
            }
            didPlayerWin = (correctChoice == playerChoice)
        case .scissors:
            
            if playerShouldWin {
                correctChoice = .rock
            } else {
                correctChoice = .paper
            }
            didPlayerWin = (correctChoice == playerChoice)
        }
        
        
        if didPlayerWin == playerShouldWin {
            playerScore += 1
        } else {
            playerScore -= 1
        }
        
        playerShouldWin.toggle()
    }
    
}  // closes struct

#Preview {  // opens preview
    ContentView()
}  // closes preview
