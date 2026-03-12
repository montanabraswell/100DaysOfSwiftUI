//

import SwiftUI

struct ContentView: View {
    private let maxNumOfQuestions = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var userScore = 0
    @State private var showingScore = false
    @State private var updateDisplayScore = false
    @State private var showAlert = false
    @State private var numOfAnsweredQuestions = 0
    @State private var gameOver = false
    @State private var alertMessage = ""
    @State private var scoreTitle = ""

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            updateDisplayScore = true
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                
                if numOfAnsweredQuestions < maxNumOfQuestions {
                    askQuestion()
                } else {
                    
                }
                
            }
        } message: {
            Text(alertMessage)
            
            
            
            
        }
    }

    func flagTapped(_ number: Int) {
        numOfAnsweredQuestions += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            showAlert = false
            updateDisplayScore = true
            userScore += 1
        
        } else {
            scoreTitle = "Wrong!"
            updateDisplayScore = false
            userScore -= 1
            showAlert = true
        }
        
        let flagMessage = "That's the flag of \(countries[correctAnswer])."
        let scoreMessage = "Your score is \(userScore)."
        let questionCountMessage = "You have answered \(numOfAnsweredQuestions) out of \(maxNumOfQuestions) questions."
        
        alertMessage = flagMessage + "\n" + scoreMessage + "\n" + questionCountMessage
        
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func questionsAsked(_ number: Int) {
       var numOfQuestions = 1
        while numOfQuestions <= 8 {
            
        }
         
    }
}

#Preview {
    ContentView()
}

