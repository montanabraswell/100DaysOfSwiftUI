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
}
struct ContentView: View {
    
  
    // Store player score 
    @State private var playerScore = 0
    // Keep track of questions til we get to 10
    @State private var numOfAnsweredQuestions = 0
    // keep track of what player picked
    @State private var playerChoice: GameChoice = .rock
    // keep track of what computer randomly picked
    @State private var computerGameChoice: GameChoice = .rock
    @State private var playerWinOrLose = false
   

    
    
    
    var body: some View {
        VStack(spacing: 30) {
            VStack{
                VStack {
                    
                }
                Text("RPS Simulator")
                    .font(.largeTitle)
                    
                
                switch self.computerGameChoice {
                case .rock:
                   Text("Rock and Win")
                case .paper:
                   Text("Paper and Win ")
                case .scissors:
                    Text("Scissor and Lose")
                }
                
                    Button("Rock") {
                    playerChoice = .rock
                    getComputerChoice()
                }
                    Button("Paper") {
                    playerChoice = .paper
                    getComputerChoice()
                }
                    Button("Scissors") {
                    playerChoice = .scissors
                    getComputerChoice()
                }
            }
        }
        
        
    }
    
    func getPlayerScore(_ number: Int) {
        
        // need counter to go to the next question each time it runs.
        numOfAnsweredQuestions += 1
        
        // we need to compare correct number and player score
        
        
    }
    
    func getComputerChoice() {
        // use randomizeGameChoice to set game choice
        let randomizeGameChoice = Int.random(in:0...2)
        
        switch randomizeGameChoice {
        case 0:
            computerGameChoice = .rock
        case 1:
            computerGameChoice = .paper
        case 2:
            computerGameChoice = .scissors
        default:
            computerGameChoice = .rock
        }
    }
}
#Preview {
    ContentView()
}
