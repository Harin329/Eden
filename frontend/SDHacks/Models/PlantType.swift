//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import Foundation

struct PlantType: Codable, Hashable {
    var PlantID: Int
    var GardenID: Int
    var PlotID: Int
    var PlantType: String
    var PlantName: String
    var Instruction: String
}
