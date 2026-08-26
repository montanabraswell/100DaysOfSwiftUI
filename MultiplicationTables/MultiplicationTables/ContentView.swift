//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Montana Braswell on 7/31/26.
//

import SwiftUI

struct ContentView: View {
  
    @State private var userAnswer = ""
    @State private var maxNumOfQuestions = 5
    @State private var currentQuestion = MultiplicationQuestion(num1: 8, num2: 7)
    // currentQuestion = "9 x 4 ="
    


    var body: some View {
        VStack {
            
            Text(currentQuestion.displayString)
                .background(.red)
                .font(.largeTitle)
                .bold()
            TextField("Enter answer here ", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .background(.green.opacity(0.5))
                .bold()
                .font(.title)
            
        }
        .background(.yellow)
        .padding()
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
