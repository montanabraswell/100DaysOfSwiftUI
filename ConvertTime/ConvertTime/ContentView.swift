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
    @State private var seconds = 0
    @State private var minutes = 0
    @State private var hours = 0
    @State private var days = 0
    
    let time = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var selectedTime = "Seconds"

    var convertTimeToUnits: Double {
        let totalSeconds = ((hours * 3600) + (minutes * 60) + seconds)
        let totalMinutes = ((hours * 60) + minutes + (seconds / 60))
        let totalHours = ((totalSeconds / 3600))
        
        return convertTimeToUnits
    }

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your time conversion", selection: $selectedTime) {
                    ForEach(time, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a time option")
        }
    }
}
  

#Preview {
    ContentView()
}
