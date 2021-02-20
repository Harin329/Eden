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
                        PlantCard()
                    }
            }.padding(.vertical, 20)
            .padding(.horizontal, 25)
        }
    }
}

struct PlantScroll_Previews: PreviewProvider {
    static var previews: some View {
        PlantScroll()
    }
}
