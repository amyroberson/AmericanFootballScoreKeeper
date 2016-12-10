//
//  main.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

let arguments = Array(CommandLine.arguments.dropFirst())
//if !arguments.isEmpty && arguments[0] == "--run-tests" {
//  runTests()
//}



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
        for _ in gameArray {
            print(" The Score for \(gameArray[index].teamOne.name) Vs. \(gameArray[index].teamTwo.name) is \(gameArray[index].teamOne.scoresToScore()) - \(gameArray[index].teamTwo.scoresToScore())" )
            index += 1
        }
        return false
    }
    
}


///////////////////////////////Main Entry Point!!!
var gameArray: [Game] = []
var currentGame: Int = 0
func startGame() {
    
    gameArray.append(createAGame())
    currentGame = gameArray.count - 1
    var done = false
    while !done {
        gameArray[currentGame] = getScoringEvents(game: gameArray[currentGame])
        done = isGameOver()
    }
    
    if wantToStartNewGame() { // not written yet
        startGame()
    }
    //printGameScores!
}

print("Welcome To Scorekeeper!")
startGame()









