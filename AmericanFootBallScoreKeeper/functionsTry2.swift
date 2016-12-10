//
//  functionsTry2.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/9/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

func getStringFromTheUser(prompt: String) -> String {
    print(prompt)
    var input: String?
    while input == nil {
        if let newInput = readLine(strippingNewline: true){
            input = newInput
        } else {
            print("That wasn't a valid answer, \(prompt)")
        }
    }
    return input!
}

func getIntFromTheUser(prompt: String) -> Int {
    print(prompt)
    var number: Int?
    while number == nil {
        if let x = readLine(strippingNewline: true),
            let tempNumber = Int(x) {
            number = tempNumber
        } else {
            print("That wasn't a valid answer, \(prompt)")
        }
    }
    return number!
}

func evaluateYN(input: String) -> Bool {
    var userInput = input
    userInput = userInput.lowercased()
    var y: Bool
    if userInput == "y" {
        y = true
    } else {
        y = false
    }
    return y
}

func getScoringEventsFromInput(prompt: String, choices: [String]) -> String {
    guard choices.count > 1 else {
        return choices[0]
    }
    print(prompt)
    var index = 0
    var newPrompt: String = ""
    
    for _ in choices {
        newPrompt.append("Enter \(index + 1) for \(choices[index]) \n")
        index += 1
    }
    
    var selectedItem: Int = -1
    while (selectedItem < 0) || (selectedItem > choices.count) {
        selectedItem = getIntFromTheUser(prompt: newPrompt)
        selectedItem -= 1
    }
    return choices[selectedItem]
}

func stringToScoringEvents(string: String) -> ScoringOption {
    switch string {
    case "Touch Down":
        return .touchDown
    case "Extra Point":
        return .extraPoint
    case "Field Goal":
        return .fieldGoal
    case "Safety":
        return .saftey
    case "Two Point Conversion":
        return .twoPointConversion
    default:
        return .invalid
    }
    
}




