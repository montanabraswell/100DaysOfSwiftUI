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
    @State private var numOfAnsweredQuestions = 0
    // new needs a starting default
    @State private var tableToPractice = 7
    //@State private var correctAnswer = Int.random(in: 0...2)
    //@State private var currentQuestion = MultiplicationQuestion(num1: 8, num2: 7)
    @State private var questionIndex = 0
    @State private var questions = [
        MultiplicationQuestion.random(table: 7),
        MultiplicationQuestion.random(table: 7)
    ]
    @State private var score = 0
    

    var body: some View {
        VStack {
            // allows user to select what number for questions to choose between
            
            Picker("Select a number of Questions", selection: $maxNumOfQuestions)
            {
                ForEach([5,10,20], id: \.self) { number in Text("\(number)")
                }
            }
            // allows user to select what number of tables to choose between
            
            Picker("Select a number of Tables", selection: $tableToPractice)
            {
                ForEach(2...12, id: \.self) { number in Text("\(number)")
                }
            }
            Text(questions[questionIndex].displayString)
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
            
            Button("Next") {
                print(" You typed: \(userAnswer)")
                print("Correct answer is \(questions[questionIndex].answerString)")
                if userAnswer == questions[questionIndex].answerString {
                    score += 1
                } else {
                    score -= 1
                }
                
                userAnswer = ""
                
               // if questionIndex < questions.count - 1 {
                    //questionIndex +=1
               // } else {
                    //print("Game Over! Final score: \(score)")
                //}
                
                guard questionIndex < questions.count - 1 else {
                    print("Game over! Final score: \(score)")
                    return
                }
                questionIndex += 1
            }
            
        }
        .background(.yellow)
        .padding()
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
