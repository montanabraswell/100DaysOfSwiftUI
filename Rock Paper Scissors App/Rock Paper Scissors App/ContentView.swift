//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI


enum GameChoice {
    case rock
    case paper
    case scissors
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
            Button("Rock") {  // opens button action
                playerChoice = .rock
                getComputerChoice()
            }  // closes button action
        }  // closes VStack

    }  // closes body
    
    func getComputerChoice() {      // opens function
        let randomizeGameChoice = Int.random(in:0...2)
        
        switch randomizeGameChoice { // opens switch
        case 0:
            computerGameChoice = .rock
        case 1:
            computerGameChoice = .paper
        case 2:
            computerGameChoice = .scissors
        default:
            computerGameChoice = .rock
        }                            // closes switch
    }                                // closes functionses function
    
    func checkAnswer() {
        var didPlayerWin = false
        switch (playerChoice, computerGameChoice) {
                       case (.rock, .rock):
                           print(" Its a draw")
                            didPlayerWin = false
                           
                       case (.rock, .paper):
                           print("paper wins")
                            didPlayerWin = true
                           
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
                            didPlayerWin = false
                           
                      case (.scissors, .scissors):
                           print(" draw ")
                            didPlayerWin = false
        }
    }
    
}  // closes struct

#Preview {  // opens preview
    ContentView()
}  // closes preview
