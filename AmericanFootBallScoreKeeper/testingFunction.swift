//
//  testingFunction.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

func runTests() {
    testScoresToScores()
    testScoresToScores2()
    testEvaluateNO()
    testEvaluateYN()
    testStringToScoringEvents()
    testStringToScoringEvents2()
    testStringToScoringEvents3()
    testStringToScoringEvents4()
    testStringToScoringEvents5()
    testStringToScoringEvents6()
}



func testScoresToScores() {
    var jets = Team(name: "Jets")
    jets.scoreArray.append(.twoPointConversion)
    jets.scoreArray.append(.touchDown)
    let result = jets.scoresToScore()
    let expectedResult = 8
    if result != expectedResult {
        print("Error adding score")
    }
    print("result is \(jets.scoresToScore()) expected result was 8")
}

func testScoresToScores2() {
    var tigers = Team(name: "Tigers")
    tigers.scoreArray.append(.extraPoint)
    tigers.scoreArray.append(.invalid)
    let result = tigers.scoresToScore()
    let expectedResult = 1
    if result != expectedResult {
        print("Error adding score")
    }
    print("result is \(tigers.scoresToScore()) expected result was 1")
}

func testEvaluateYN() {
    let yes = evaluateYN(input:"Y")
    if yes {
        print("Evaluate Yes is True")
    } else {
        print("Evaluate Yes failed!")
    }
}

func testEvaluateNO() {
    let yes = evaluateYN(input:"n")
    if !yes {
        print("Evaluate No passed")
    } else {
        print("Evaluate No failed!")
    }
}

func testStringToScoringEvents(){
    let scoreEvent = stringToScoringEvents(string: "Touch Down")
    let result: ScoringOption = .touchDown
    if result == scoreEvent {
        print("String to Scoring Option .touchdown Passed!")
    } else {
        print("String to Scoring Option .touchdown failed!")
    }
}

func testStringToScoringEvents2(){
    let scoreEvent = stringToScoringEvents(string: "Extra Point")
    let result: ScoringOption = .extraPoint
    if result == scoreEvent {
        print("String to Scoring Option .extraPoint Passed!")
    } else {
        print("String to Scoring Option .extraPoint failed!")
    }
}

func testStringToScoringEvents3(){
    let scoreEvent = stringToScoringEvents(string: "Field Goal")
    let result: ScoringOption = .fieldGoal
    if result == scoreEvent {
        print("String to Scoring Option .fieldGoal Passed!")
    } else {
        print("String to Scoring Option .fieldGoal failed!")
    }
}

func testStringToScoringEvents4(){
    let scoreEvent = stringToScoringEvents(string: "Safety")
    let result: ScoringOption = .safety
    if result == scoreEvent {
        print("String to Scoring Option .safety Passed!")
    } else {
        print("String to Scoring Option .safety failed!")
    }
}

func testStringToScoringEvents5(){
    let scoreEvent = stringToScoringEvents(string: "Two Point Conversion")
    let result: ScoringOption = .twoPointConversion
    if result == scoreEvent {
        print("String to Scoring Option .twoPointConversion Passed!")
    } else {
        print("String to Scoring Option .twoPointConversion failed!")
    }
}

func testStringToScoringEvents6(){
    let scoreEvent = stringToScoringEvents(string: "Two Point Convers")
    let result: ScoringOption = .invalid
    if result == scoreEvent {
        print("String to Scoring Option .invalid Passed!")
    } else {
        print("String to Scoring Option .invalid failed!")
    }
}

