//
//  ContentView.swift
//  WeSplit
//
//  Created by Montana Braswell on 1/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var subTotal: Double = 100
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = subTotal / 100 * tipSelection
        let grandTotal = subTotal + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalAmount: Double {
        let tipValue = subTotal / 100 * Double(tipPercentage)
        
      
        
        return subTotal + tipValue
    }
    
    var totalAmountTextColor: Color {
        if tipPercentage == 0 {
            return .red
        } else {
            return .black
        }
    }
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                amountSection

                tipSelectionSection
        
                totalAmountSection
               
                amountPerPersonAmount
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                    
                }
            }
        }
    }
    
    @ViewBuilder
    var amountSection: some View {
        Section {
            TextField("Amount", value: $subTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
            
            Picker("Number of people", selection: $numberOfPeople) {
                ForEach(2..<100) {
                    Text("\($0) people")
                }
            }
            .pickerStyle(.navigationLink)
        }
    }
    
    var tipSelectionSection: some View {
        Section("How much do you want to tip?") {
            Picker("Tip percentage", selection: $tipPercentage) {
                ForEach(0..<101) {
                    Text("\($0)%")
                }
            }
            .pickerStyle(.navigationLink)
        }
    }
    
    var totalAmountSection: some View {
        
        Section("Total Amount") {
            Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(totalAmountTextColor)
        }
        
    }
    
    var amountPerPersonAmount: some View {
         Section("Amount per person") {
             Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
         }
        
    }
        
}

#Preview {
    ContentView()
}
