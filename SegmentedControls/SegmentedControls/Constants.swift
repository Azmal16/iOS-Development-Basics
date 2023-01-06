//
//  Constants.swift
//  SegmentedControls
//
//  Created by MMH on 6/1/23.
//

import Foundation

var imageNameDict = ["IronMan":"ironman",
            "Captain":"captain",
            "Hulk":"hulk",
            "Thor":"thor"]

enum SuperHeroNames: String, CaseIterable {
    case ironMan = "IronMan"
    case captainAmerica = "Captain"
    case hulk = "Hulk"
    case thor = "Thor"
}
