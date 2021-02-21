//
//  PlantCare.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantCare: View {
    var body: some View {
        VStack {
            Text("Allow soil to dry between waterings and take extra special care not to over water in winter. Avoid getting leaves wet when you water.")
                .font(.custom("Poppins-Light", size: 12))
                .foregroundColor(Color(hex: "3a3a3a"))
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding()
                .background(Rectangle()
                                .fill(Color(hex: "f8f8f8"))
                                .cornerRadius(10))
                .padding(.top, 40)
                .padding(.bottom, 15)
            Text("Place in indirect light and fertilize during the growing season with an all-purpose plant food.")
                .font(.custom("Poppins-Light", size: 12))
                .foregroundColor(Color(hex: "3a3a3a"))
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding()
                .background(Rectangle()
                                .fill(Color(hex: "f8f8f8"))
                                .cornerRadius(10))
        }.padding(.bottom,60)
    }
}

struct PlantCare_Previews: PreviewProvider {
    static var previews: some View {
        PlantCare()
    }
}
