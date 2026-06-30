//
//  ContentView.swift
//  WordScramble
//
//  Created by Montana Braswell on 6/22/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var diplayStartWord = false
    @State private var userScore = 0
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                Section{
                    Text("Score: \(userScore)")
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok") { }
            }  message: {
                    Text(errorMessage)
                }
            .toolbar {
                Button("Restart Game", action: restartGame)
                }
            }
        .navigationTitle("WordScramble")
        }
    
    func calculateScore(word: String) {
        
        if word.count >= 3 && word.count <= 5 {
            userScore += 1
        } else if word.count >= 6 && word.count <= 8 {
            userScore += 5
        } else if word.count >= 9{
            userScore += 10
        }

    }
    
    func restartGame() {
        // pick a new word
        startGame()
        userScore = 0
        usedWords = []
    }
    
    func addNewWord() {
        
        // lower cases the word,
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer != rootWord.lowercased() else {
            wordError(title: "Can't use the same word as the start word", message: "try again")
            return
        }
        guard answer.count >= 3 else {
            wordError(title: "Word is too short", message: "try again")
            return
        }
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word with \(rootWord)'! ")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up you know!")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
            calculateScore(word: answer)
            
        }
        newWord = ""
    }
    
    func startGame() {
        
        // find the URL for start.txt inside our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            //  Load start.txt into a string
            if let startsWords = try? String(contentsOf: startWordsURL) {
                // Split the string up into an array of strings, splitting on line breaks
                let allWords = startsWords.components(separatedBy: "\n")
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                // everything worked correctly, exit start game method
                return
            }
        }
        // if we end up here there was a problem, trigger the crash and report it
        fatalError("Could not load start.txt from bundle.")
    }
        // checks if word has been used before and sets the result as true or false
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at:pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
