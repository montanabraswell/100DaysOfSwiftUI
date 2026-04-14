//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Montana Braswell on 4/13/26.
//

import SwiftUI

struct RockMoves: View {
    var body: some View {
        Text("Rock")
    }
}

struct PaperMoves: View {
    var body: some View {
        Text("Paper")
    }
}

struct ScissorsMoves: View {
    var body: some View {
        Text("Scissors")
    }
}
struct ContentView: View {
    @State private var rockMoves = ""
    @State private var paperMoves = ""
    @State private var scissorsMove = ""
    
    @State private var playerWinOrLose = false
    
    enum GameChoice {
        case rock, paper, scissors
    }
    
    @State private var gameChoice = GameChoice.rock
    
    var body: some View {
        VStack {
            if Bool.random() {
                Rectangle()
            } else {
                Circle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
//switch gameChoice {
//case .rock:
   // Text("Rock")
//case .paper:
    //<#code#>
//case .scissors:
    //<#code#>
