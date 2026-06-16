//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI

struct RockPaperScissorsView: View {  // opens struct
    
    @State private var viewModel = RockPaperScissorsViewModel()

    var body: some View {  // opens body
        NavigationStack {  // opens NavigationStack
            VStack(spacing: 20) {  // opens VStack
                instructionTexts
                playerChoiceButtons
                Text("Score: \(viewModel.playerScore)")
            }  // closes VStack
            .navigationTitle("RPS Simulator")
            .alert("Game Over!\nFinal score is: \(viewModel.playerScore)", isPresented: $viewModel.isShowingGameOverAlert) {
                Button("Restart") {
                    viewModel.resetGame()
                }
            }  // closes alert
        }  // closes navigation stack
    }  // closes body
    
    private var instructionTexts: some View {
        VStack {
            Text("Your opponent chose: \(viewModel.computerGameChoice.displayValue).")
            
            Text("Your goal is to : \(viewModel.playerShouldWin ? " Win " : "Lose ")")
            
            Text("Which should you choose?")
                .padding(.top, 8)
        }
    }
    
    private var playerChoiceButtons: some View {
        VStack {
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    viewModel.playerDidChoose(choice)
                }  // closes button action
            }
        }
    }
}  // closes struct

#Preview {  // opens preview
    RockPaperScissorsView()
}  // closes preview
