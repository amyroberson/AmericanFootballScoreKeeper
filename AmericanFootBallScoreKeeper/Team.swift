//
//  Team.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

class Team {
    var name: String
    var scoresArray : [String]
    var totalScore: Int
    
    init(name: String, scores: [String], totalScore: Int) {
        self.name = name
        self.scoresArray = scores
        self.totalScore = totalScore
    }
    
    func scoresToTotalScore(scores: [String]) -> Int? {
        let possibleScores = [ "touchDown", "extraPoint", "saftey", "twoPointConversion", "fieldGoal"]
        for score in scores{
            if possibleScores.contains(score){
                switch score{
                case "touchdown":
                    totalScore += 6
                case "extraPoint", "fieldGoal":
                    totalScore += 1
                
                case "saftey", "twopPointConversion":
                    totalScore += 2
                default:
                    print("I need to work on this")
                    return nil
                    
                }
            }
        }
        return totalScore
    }
}
