//
//  testingFunction.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation


func runTests() {
    print(testScoresToTotalScores(team: jets, scores: jets.scoresArray)) // pass in values to recreate data
    testScoresToScores2()
}


func testScoresToTotalScores(team: Team, scores:[ScoringOptions]) -> Bool {
    let result = team.scoresToTotalScore(scores: team.scores)
    let expectedResult = team.score
    if result == expectedResult {
        return true
    }
    return false
}

func testScoresToScores2() {
    let tigers = Team(name: "Tigers")
    let result = tigers.scoresToTotalScore(scores: tigers.scoresArray)
    //let expectedResult = 7
    //if result != expectedResult{
      //  print("Error adding score")
    //}
    print(result!)
}
