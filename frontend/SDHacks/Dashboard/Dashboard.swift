//
//  Dashboard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
            ZStack {
                DashboardHead()
                Button(action: {}){
                    NearbyCard()
                }.foregroundColor(.black)
                .offset(y: -200)
                HStack {
                    Button(action:{}) {
                        Text("Plots")
                            .font(.system(size: 26))
                            .foregroundColor(.black)
                    }.padding(.trailing, 20)
                    Button(action:{}) {
                        Text("Saved")
                            .font(.system(size: 26))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action:{}) {
                        Text("See all")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 25)
                .offset(y: -90)
                PlantScroll()
                    .offset(y: 110)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .background(
                Image("dashboardBG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }.accentColor( Color(hex: "#000"))
    }
}




struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
