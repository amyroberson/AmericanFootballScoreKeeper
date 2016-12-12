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
        return .safety
    case "Two Point Conversion":
        return .twoPointConversion
    default:
        return .invalid
    }
    
}

func createAGame() -> Game{
    let firstInput = getStringFromTheUser(prompt: "What is team one?")
    let secondInput = getStringFromTheUser(prompt: "What is team two?")
    let newGame: Game
    
    let team1 = Team(name: firstInput)
    let team2 = Team(name: secondInput)
    
    newGame = Game(teamOne: team1, teamTwo: team2)
    
    return newGame
}

func getScoringEvents(game: Game) -> Game{
    var newGame = game
    var firstInput = getStringFromTheUser(prompt: "Has anyone Scored? y for Yes or n for No")
    
    while evaluateYN(input: firstInput) {
        var teamInput = getIntFromTheUser(prompt:
            "Who Scored? \nEnter 1 for \(newGame.teamOne.name) or Enter 2 for \(newGame.teamTwo.name)")
        
        while teamInput != 1 && teamInput != 2 {
            teamInput = getIntFromTheUser(prompt:
                "Remember: to enter 1 for \(newGame.teamOne.name) or 2 for \(newGame.teamTwo.name)")}
        
        if teamInput == 1 {
            let how = getScoringEventsFromInput(prompt:
                "How did \(newGame.teamOne.name) Score?", choices: newGame.teamOne.scoringOptions)
            let scoringEvent = stringToScoringEvents(string: how)
            newGame.teamOne.scoreArray.append(scoringEvent)
        }
        
        if teamInput == 2 {
            let how = getScoringEventsFromInput(prompt:
                "How did \(newGame.teamTwo.name) Score?", choices: newGame.teamOne.scoringOptions)
            let scoringEvent = stringToScoringEvents(string: how)
            newGame.teamTwo.scoreArray.append(scoringEvent)
        }
        firstInput = getStringFromTheUser(prompt: "Has anyone Scored? y for Yes or n for No")
        
    }
    return newGame
}

func isGameOver() -> Bool{
    let gameOver = getStringFromTheUser(prompt: "Is The Game Over? y for Yes or n for No")
    if evaluateYN(input: gameOver) { //Yes return true
        return true
    } else {
        return false
    }
}

func wantToStartNewGame() -> Bool {
    let isThereANewGame = getStringFromTheUser(prompt:
        "Would you like to keep score for a new game? y for Yes or n for No")
    if evaluateYN(input: isThereANewGame) {
        return true
    } else {
        print("Thanks for Keeping Score")
        //need to update for multiple games!!!!
        var index = 0
        var printScorePrompt = ""
        for _ in gameArray {
            printScorePrompt = printScorePrompt + ("\nTo see the score for \(gameArray[index].teamOne.name) Vs. \(gameArray[index].teamTwo.name) Enter \(index + 1)")
            index += 1
        }
        var x = getIntFromTheUser(prompt: printScorePrompt)
        
        while x <= gameArray.count{
            print(" The Score for \(gameArray[x - 1].teamOne.name) Vs. \(gameArray[x - 1].teamTwo.name) is \(gameArray[x - 1 ].teamOne.scoresToScore()) - \(gameArray[x - 1].teamTwo.scoresToScore())" )
        
            let YesNo = getStringFromTheUser(prompt:"Would you like to see another score? y for Yes or n for No")
            if !evaluateYN(input: YesNo){
                return false
            } else {
                x = getIntFromTheUser(prompt: printScorePrompt)

            }
        }
        return false
    }
    
}

func startGame() {
    
    gameArray.append(createAGame())
    currentGame = gameArray.count - 1
    var done = false
    while !done {
        gameArray[currentGame] = getScoringEvents(game: gameArray[currentGame])
        done = isGameOver()
    }
    
    if wantToStartNewGame() {
        startGame()
    }
    
}



