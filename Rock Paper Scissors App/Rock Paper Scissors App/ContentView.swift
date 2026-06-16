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
        VStack {  // opens VStack
            Text("RPS Simulator")
                .padding(.vertical)
            
            Text("Your opponent chose: \(viewModel.computerGameChoice.displayValue).")
            
            Text("Your goal is to : \(viewModel.playerShouldWin ? " Win " : "Lose ")")
            
            Text("Which should you choose?")
                .padding(.vertical)
            
            ForEach(GameChoice.allCases, id: \.self) { choice in
                Button(choice.displayValue) {  // opens button action
                    viewModel.playerDidChoose(choice)
                }  // closes button action
            }
            
            Text("Score: \(viewModel.playerScore)")
                .padding()
                .alert("Game Over!\nFinal score is: \(viewModel.playerScore)", isPresented: $viewModel.isShowingGameOverAlert) {
                    Button("Restart") {
                        viewModel.resetGame()
                    }
                }
        }  // closes VStack
    }  // closes body
}  // closes struct

#Preview {  // opens preview
    RockPaperScissorsView()
}  // closes preview
