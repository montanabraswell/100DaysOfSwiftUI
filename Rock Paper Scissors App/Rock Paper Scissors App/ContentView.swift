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
    
    @State private var ChooseGameChoice: GameChoice = .rock
    @State private var playerWinOrLose = false
    
    
    
    var body: some View {
        VStack {
            
            Text("Choose your weapon!")
            
            Button("Rock") {
                if GameChoice.rock == .rock {
                    print("Rock and Win")
                }
            }
            Button("Paper") {
                if GameChoice.rock == .paper {
                    print("Paper and Win")
                }
            }
            Button("Scissors") {
                if GameChoice.scissors == .scissors {
                    print("Scissors and Win")
                }
                
            }
            
        }
        
    }
}
#Preview {
    ContentView()
}
