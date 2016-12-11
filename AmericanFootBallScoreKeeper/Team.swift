//
//  Team.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

struct Team {
    var name: String
    var scoreArray : [ScoringOption]
    let scoringOptions = ["Touch Down", "Extra Point", "Field Goal", "Safety", "Two Point Conversion"]
    init(name: String) {
        self.name = name
        self.scoreArray = []
    }
    
    func scoresToScore() -> Int {
        var newScore: Int = 0
        for score in self.scoreArray{
            switch score{
            case .touchDown:
                newScore = newScore + 6
            case .extraPoint, .fieldGoal:
                newScore = newScore + 1
            case .safety, .twoPointConversion:
                newScore =  newScore + 2
            case .invalid:
                newScore = newScore + 0
            }
        }
        return newScore
    }
}

enum ScoringOption {
    case touchDown
    case fieldGoal
    case extraPoint
    case safety
    case twoPointConversion
    case invalid
}


struct Game {
    var teamOne: Team
    var teamTwo: Team
    var team1Score: Int{
        return self.teamOne.scoresToScore()
    }
    var team2Score: Int{
        return self.teamTwo.scoresToScore()
    }
}

