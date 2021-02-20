//
//  PlantScroll.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) {_ in
                    let pInfo = PlantType(plant_id: 1, garden_id: 1, plot_id: 1, plant_type: "Tomato Plant", plant_name: "Alex", instruction: "Water")
                    PlantCard(plantInfo: pInfo)
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
