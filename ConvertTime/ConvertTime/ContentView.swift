//
//  ContentView.swift
//  ConvertTime
//
//  Created by Montana Braswell on 2/2/26.
//
// Convert time and allow users to choose seconds, minutes, hours or days.
// Create a title
// Create a form (stack)
// Create Picker (to make drop down)

import SwiftUI

struct ContentView: View {
    @State private var seconds: Int = 0
    @State private var minutes: Int = 0
    @State private var hours: Int = 0
    @State private var days: Int = 0
    @State private var calculate: Int = 0
    
    let time = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var selectedTime = "Seconds"

    var body: some View {
        NavigationStack {
            Form {
                Section("Calculate Time below, enter a number."){
                    TextField("Enter a number to convert", value: $seconds, format: .number)
                        .keyboardType(.decimalPad)

                    Button("Calculate: \(calculate)") {
                        calculate += 1
                    }
                }
                Picker("Select your time conversion", selection: $selectedTime) {
                    ForEach(time, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("ConvertTime")
        }
    }
}
  

#Preview {
    ContentView()
}
