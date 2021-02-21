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
            ScrollView(showsIndicators: false) {
                ZStack {
                    DashboardHead()
                        .zIndex(1.0)
                    VStack {
                        Button(action: {}){
                            NearbyCard()
                        }.foregroundColor(.black)
                        HStack {
                            Button(action:{}) {
                                Text("Plants")
                                    .font(.custom("Poppins-Medium", size: 20))
                                    .foregroundColor(Color(hex: "3a3a3a"))
                            }.padding(.trailing, 15)
                            Button(action:{}) {
                                Text("Saved")
                                    .font(.custom("Poppins-Medium", size: 20))
                                    .foregroundColor(Color(hex: "c9c9c9"))
                            }
                            Spacer()
                            NavigationLink(destination: Plots()) { 
                                Text("See all")
                                    .font(.custom("Poppins-Medium", size: 13))
                                    .foregroundColor(Color(hex: "383F56"))
                            }
                        }
                        .padding(.top, 25)
                        .padding(.horizontal, 25)
                        PlantScroll()
                            .offset(y: -10)
                        RecentContributors()
                            .padding(.bottom, 80)
                    }.offset(y: 85)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .offset(y: 0)
                .background(
                    Rectangle()
                        .fill(Color(hex: "F4F1EF"))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 400))
            }
        }.accentColor( Color(hex: "#000"))
    }
}



struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
