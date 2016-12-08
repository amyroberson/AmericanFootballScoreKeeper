//
//  testingFunction.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

var jets = Team(name: "Jets", scores: ["touchdown"], totalScore: 0)

func runTests() {
    print(testScoresToTotalScores(team: jets, scores: jets.scoresArray)) // pass in values to recreate data
}


func testScoresToTotalScores(team: Team, scores:[String]) -> Bool {
    let result = team.scoresToTotalScore(scores: team.scoresArray)
    let expectedResult = team.totalScore
    if result == expectedResult {
        return true
    }
    return false
}
    
