//
//  InputView.swift
//  unit converter
//
//  Created by Natalie Ammerman on 10/1/24.
//

import SwiftUI

struct InputView: View {
    @State private var inputValue: Double = 0.0
    @State private var inputUnit = "mL"
    @State private var convertUnit = "mL"
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var InputToMilliliter: Double {
        if inputUnit == "mL" {
            return inputValue
        } else if inputUnit == "Liters" {
            return inputValue * literToMilliliter
        } else if inputUnit == "Cups" {
            return inputValue * cupToMilliliter
        } else if inputUnit == "Pints" {
            return inputValue * pintToMilliliter
        } else if inputUnit == "Gallons" {
            return inputValue * gallonToMilliliter
        }
        return inputValue
    }
    
    var MilliliterToOutput: Double {
        if convertUnit == "mL" {
            return InputToMilliliter
        } else if convertUnit == "Liters" {
            return InputToMilliliter / literToMilliliter
        } else if convertUnit == "Cups" {
            return InputToMilliliter / cupToMilliliter
        } else if convertUnit == "Pints" {
            return InputToMilliliter / pintToMilliliter
        } else if convertUnit == "Gallons" {
            return InputToMilliliter / gallonToMilliliter
        }
        return InputToMilliliter
    }
    
   
    var body: some View {
        NavigationStack {
            Form {
                Section("INPUT VALUE AND UNIT") {
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("CONVERT TO") {
                    Picker("Unit", selection: $convertUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("OUTPUT") {
                    Text("\(MilliliterToOutput, specifier: "%.2f")")
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    InputView()
}
