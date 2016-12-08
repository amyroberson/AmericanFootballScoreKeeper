//
//  main.swift
//  AmericanFootBallScoreKeeper
//
//  Created by Amy Roberson on 12/8/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

let arguments = Array(CommandLine.arguments.dropFirst())
if !arguments.isEmpty && arguments[0] == "--run-tests" {
    runTests()
}

