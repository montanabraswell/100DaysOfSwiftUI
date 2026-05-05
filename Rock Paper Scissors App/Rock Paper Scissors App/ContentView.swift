//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI


enum GameChoice: CaseIterable {
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
}  // closes enum

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



    var body: some View {  // opens body
        VStack {  // opens VStack
            Text("RPS Simulator")
                .padding(.vertical)
            
            Text("Your opponent chose rock.") // TODO update this to when someone clicks what should show which variable same to line 45
            Text("Your goal is to win.") // TODO
            
            Text("Which should you choose?")
                .padding(.vertical)
            
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    playerChoice = choice
                    checkAnswer()
                    getComputerChoice()
                    
                }  // closes button action
            }
            
            
            Text("Score: \(playerScore)")
                .padding()
          
        }  // closes VStack

    }  // closes body
    
    func getComputerChoice() {     // opens function
        computerGameChoice = GameChoice.allCases.randomElement() ?? .rock
    }
    
    func checkAnswer() {
        // compare player choice and computer game choice
        // compare case and check if its correct
        // if correct, plus one to the score
        // if incorrect minus one to the score
        // compare if did player win and should they win
    
        var didPlayerWin: Bool
        var correctChoice: GameChoice
        
        switch computerGameChoice {
        case .rock:
            //copy teh rest to paper and scissors then uncomments line 97 to 101
            if playerShouldWin {
                correctChoice = .paper
            } else {
                correctChoice = .scissors
            }
        case .paper:
            // TODO
            break
        case .scissors:
            // TODO
            break
        }
        
//        if playerChoice == correctChoice {
//            playerScore += 1
//        } else {
//            playerScore -= 1
//        }
        
        switch (playerChoice, computerGameChoice) {
                       case (.rock, .rock):
                           print(" Its a draw")
                            didPlayerWin = false
                           
                       case (.rock, .paper):
                           print("paper wins")
                            didPlayerWin = false
                           
                       case (.rock, .scissors):
                           print(" Rock wins")
                            didPlayerWin = true
            
                       case (.paper, .rock):
                           print(" paper wins ")
                            didPlayerWin = true
            
                       case (.paper, .paper):
                           print(" draw ")
                            didPlayerWin = false
            
                       case (.paper, .scissors):
                           print(" scissors wins ")
                            didPlayerWin = false
            
                      case (.scissors, .rock):
                           print(" rock wins ")
                            didPlayerWin = false
                           
                      case (.scissors, .paper):
                           print(" scissors wins ")
                            didPlayerWin = true
                           
                      case (.scissors, .scissors):
                           print(" draw ")
                            didPlayerWin = false
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
