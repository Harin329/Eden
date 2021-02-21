//
//  PlantAbout.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantAbout: View {
    var body: some View {
        VStack {
            HStack {
                Text("Basil")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundColor(Color(hex: "3a3a3a"))
                Spacer()
            }.padding(.top, 30)
            .padding(.bottom, 1)
            HStack {
                Text("Ocimum basilicum")
                    .font(.custom("Poppins-Medium", size: 12))
                    .foregroundColor(Color(hex: "3a3a3a"))
                Spacer()
            }.padding(.bottom, 2)
            Text("Basil is a culinary herb of the family Lamiaceae. It is native to tropical regions from central Africa to Southeast Asia. It is a tender plant, and is used in cuisines worldwide.")
                .font(.custom("Poppins-Light", size: 12))
                .foregroundColor(Color(hex: "3a3a3a"))                .foregroundColor(Color(hex: "3a3a3a"))
                .padding(.bottom, 20)
            HStack {
                VStack {
                    HStack {
                        Text("Origin")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color(hex: "3a3a3a"))
                        Spacer()
                    }
                    HStack {
                        Text("West Africa")
                            .font(.custom("Poppins-Light", size: 12))
                            .foregroundColor(Color(hex: "3a3a3a"))
                        Spacer()
                    }
                }
                VStack {
                    HStack {
                        Text("Bloom time")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color(hex: "3a3a3a"))
                        Spacer()
                    }
                    HStack {
                        Text("Spring")
                            .font(.custom("Poppins-Light", size: 12))
                            .foregroundColor(Color(hex: "3a3a3a"))
                        Spacer()
                    }
                }
            }
        }.padding(.horizontal, 25)
        .padding(.bottom,60)
    }
}

struct PlantAbout_Previews: PreviewProvider {
    static var previews: some View {
        PlantAbout()
    }
}
