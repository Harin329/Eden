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
                .font(.system(size: 14))
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding()
                .background(Rectangle()
                                .fill(Color(hex: "f8f8f8"))
                                .cornerRadius(10))
                .padding(.top, 40)
                .padding(.bottom, 20)
            Text("Place in indirect light and fertilize during the growing season with an all-purpose plant food.")
                .font(.system(size: 14))
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding()
                .background(Rectangle()
                                .fill(Color(hex: "f8f8f8"))
                                .cornerRadius(10))
        }
    }
}

struct PlantCare_Previews: PreviewProvider {
    static var previews: some View {
        PlantCare()
    }
}
