//
//  PlantDescriptionHeader.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantDescriptionHeader: View {
    @Binding var selected: String
    @State var heart = false
    var body: some View {
        HStack {
            Button(action: {
                selected = "About"
            }) {
                Text("About")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color(hex: selected == "About" ? "3a3a3a" : "c9c9c9"))
            }.padding(.trailing, 15)
            Button(action: {
                selected = "Care"
            }) {
                Text("Care")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color(hex: selected == "Care" ? "3a3a3a" : "c9c9c9"))
            }.padding(.trailing, 15)
            Button(action: {
                selected = "Images"
            }) {
                Text("Images")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color(hex: selected == "Images" ? "3a3a3a" : "c9c9c9"))
            }
            Spacer()
            Button(action: {
                heart.toggle()
            }) {
                Image(heart ? "HeartFill" : "Heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(10)
            }
            .background(Rectangle()
                            .fill(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 1 ))
            .padding(.trailing, 10)
        }.padding(.horizontal, 25)
    }
}

