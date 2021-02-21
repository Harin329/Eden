//
//  PlantDescription.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantDescription: View {
    @State var selected = "About"
    var body: some View {
        VStack {
            PlantDescriptionHeader(selected: $selected)
            if selected == "About" {
                PlantAbout()
            }
            else if selected == "Care" {
                PlantCare()
            }
            else {
                Image("Gallery")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 50, height: .infinity)
                    .padding(.top, 30)
            }
            Spacer()
        }
        .frame(minHeight: 300)
        .padding(.top, 20)
        .padding(.bottom, 30)
        .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2))
    }
}

struct PlantDescription_Previews: PreviewProvider {
    static var previews: some View {
        PlantDescription()
    }
}
