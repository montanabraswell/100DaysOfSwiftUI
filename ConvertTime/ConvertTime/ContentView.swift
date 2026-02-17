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
    @State private var inputValue: Double = 0
    @State private var inputUnit: String = "Seconds"
    @State private var outputUnit: String = "Minutes"
    
    let time = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var selectedTime = "Seconds"
    
    func toSeconds(_ value: Double, unit: String) -> Double {
        switch unit {
        case "Minutes":
            return value * 60
        case "Hours":
            return value * 3_600
        case "Days":
            return value * 86_400
        default: // seconds
            return value
        }
    }
    
    func fromSeconds(_ seconds: Double, unit: String) -> Double {
        switch unit {
        case "Minutes":
            return seconds / 60
        case "Hours":
            return seconds / 3_600
        case "Days":
            return seconds / 86_400
        default:
            return seconds
        }
    }
    
    var convertedValue: Double {
        
        let seconds = toSeconds(inputValue, unit: inputUnit)
        return fromSeconds(seconds, unit: outputUnit)
        
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a number to convert?"){
                    TextField("Enter a value ", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                }
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(time, id: \.self) { unit in
                        Text(unit)
                    }
                }
            }
            
            Section("To") {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(time, id: \.self) { unit in
                        Text(unit)
                    }
                }
                
                Section("Result") {
                  Text(convertedValue,
                       format: .number.precision(.fractionLength(2))
                       )
                }
            }
            .navigationTitle("ConvertTime")
        }
    }
}
  

#Preview {
    ContentView()
}
