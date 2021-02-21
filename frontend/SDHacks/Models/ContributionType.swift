//
//  Contribution.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import Foundation

struct ContributionType: Codable, Hashable {
    var UserID: Int
    var GardenID: Int
    var PlotID: Int
    var PlantID: Int
    var Date: Date
    var ContributionType: String
}
