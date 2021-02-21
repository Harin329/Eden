//
//  PlantDescription.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantDescription: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("About")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "3a3a3a"))
                }
                Button(action: {}) {
                    Text("Care")
                }
                Button(action: {}) {
                    Text("Image")
                }
                Spacer()
                Button(action: {}) {
                    Text("<3")
                }
            }.padding(.horizontal, 25)
        }
    }
}

struct PlantDescription_Previews: PreviewProvider {
    static var previews: some View {
        PlantDescription()
    }
}
