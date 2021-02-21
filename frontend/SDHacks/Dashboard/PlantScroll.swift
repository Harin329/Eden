//
//  PlantScroll.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantScroll: View {
    private let plants: [PlantType]
    
    init() {
        print(PlantEndpoints.getPlantsInGroup(plotID: 1))
        self.plants = PlantEndpoints.getPlantsInGroup(plotID: 1)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(self.plants, id: \.self) { plant in
//                    let pInfo = PlantType(PlantID: 1, GardenID: 1, PlotID: 1, PlantType: "Tomato Plant", PlantName: "Alex", Instruction: "Water")
                    PlantCard(plantInfo: plant)
                    }
            }.padding(.vertical, 15)
            .padding(.horizontal, 25)
        }
    }
}

struct PlantScroll_Previews: PreviewProvider {
    static var previews: some View {
        PlantScroll()
    }
}
