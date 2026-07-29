//

import SwiftUI


struct LargeTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(LargeTitleStyle())
    }
}



struct ContentView: View {
    private let maxNumOfQuestions = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var userScore = 0
    @State private var numOfAnsweredQuestions = 0
    
    @State private var isShowingQuestionAnswerAlert = false
    @State private var questionAnswerAlertTitle = ""
    @State private var questionAnswerAlertMessage = ""
    
    @State private var isShowingGameOverAlert = false
    @State private var gameOverAlertTitle = ""
    @State private var gameOverAlertMessage = ""
    
    @State private var isFlagTappedSpinning = false
    @State private var numOfRotations = 0.0
    
    @State private var attempts: Int = 0
    
    struct Shake: GeometryEffect {
        var amount: CGFloat = 10
        var shakesPerUnit = 3
        var animatableData: CGFloat
        
        func effectValue(size: CGSize) -> ProjectionTransform {
               ProjectionTransform(CGAffineTransform(translationX:
                   amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                   y: 0))
           }
    }
    
  
    
    struct FlagImage: View {
        var imageName: String
        
        var body: some View {
            Image(imageName)
                .clipShape(.capsule)
                .shadow(radius: 5)
        }
    }

    
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
                    .titleStyle()
                    //.font(.largeTitle.bold())
                    //.foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .modifier(LargeTitleStyle())
                            //.font(.largeTitle.weight(.semibold))
                        
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            // should rotate if correct answer == number
//                            if correctAnswer == number {
                            let rotationDegrees = correctAnswer == number ? numOfRotations * 360 : 0
                        
                                FlagImage(imageName: countries[number])
                                    .rotation3DEffect(.degrees(rotationDegrees), axis: (x: 0, y: 1, z: 0))
                                    .animation(
                                        .linear(duration: 2),
                                        value: numOfRotations
                                    )
                        }
                        .opacity(isShowingQuestionAnswerAlert && number != correctAnswer ? 0.25 : 1)
                        
                        .modifier(Shake(animatableData: CGFloat(self.attempts)))
                       
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(userScore)")
                    .modifier(LargeTitleStyle())
                    //.foregroundStyle(.white)
                    //.font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(questionAnswerAlertTitle, isPresented: $isShowingQuestionAnswerAlert) {
            Button("Continue") {
                if numOfAnsweredQuestions < maxNumOfQuestions {
                    askQuestion()
                } else {
                    showGameOverAlert()
                }
            }
        } message: {
            Text(questionAnswerAlertMessage)
        }
        
        
        .alert(gameOverAlertTitle, isPresented: $isShowingGameOverAlert) {
            Button("Restart") {
               
                resetGame()
            }
    
            
        } message: {
            Text(gameOverAlertMessage)
        }
    }

    
    func flagTapped(_ number: Int) {
        numOfAnsweredQuestions += 1
        
        if number == correctAnswer {
            questionAnswerAlertTitle = "Correct!"
            //showAlert = false
            //updateDisplayScore = true
            userScore += 1
            
            numOfRotations += 1

        
        } else {
            questionAnswerAlertTitle = "Wrong!"
            //updateDisplayScore = false
            userScore -= 1
            //showAlert = true
            userScore -= 1
            // adding default animations
            withAnimation(.default) {
                self.attempts += 1
            }
        }
        
        let flagMessage = "That's the flag of \(countries[correctAnswer])."
        let scoreMessage = "Your score is \(userScore)."
        let questionCountMessage = " \(numOfAnsweredQuestions) out of \(maxNumOfQuestions) questions."
        
        questionAnswerAlertMessage = questionCountMessage + "\n" + flagMessage + "\n" + scoreMessage
        
        isShowingQuestionAnswerAlert = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func showGameOverAlert() {
        
            //showAlert = true
            //updateDisplayScore = true
            
            let gameOver =  "You answered \(numOfAnsweredQuestions) correctly!"
            let finalScoreMessage = "Your final score is \(userScore)"
            let restartGame = "Play again?"
            
            gameOverAlertTitle = "Game Over!"
            gameOverAlertMessage = gameOver + "\n" + finalScoreMessage + "\n" + restartGame
            
            isShowingGameOverAlert = true
         
    }
    
    func resetGame() {
        userScore = 0
        numOfAnsweredQuestions = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}

