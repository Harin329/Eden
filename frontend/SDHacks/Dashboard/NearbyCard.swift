//
//  NearbyCard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct NearbyCard: View {
    var body: some View {
        HStack {
            Image("dashboard1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(5)
                .padding(.leading, 10)
            VStack {
                HStack {
                    Text("Nearby: Hilltop Drive")
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(Color(hex: "3a3a3a"))
                    Spacer()
                }
                VStack {
                    HStack {
                        HStack {
                            Text("1km away")
                                .font(.custom("Poppins-Medium", size: 8))
                                .foregroundColor(Color(hex: "#fff"))
                                .padding([.vertical],5)
                                .frame(width:80)
                        }
                        .background(Color(hex: "3A3A3A"))
                        .cornerRadius(8)
                        HStack {
                            Text("8 Plots")
                                .font(.custom("Poppins-Medium", size: 8))
                                .foregroundColor(Color(hex: "#fff"))
                                .padding([.vertical],5)
                                .frame(width:70)
                        }
                        .background(Color(hex: "3A3A3A"))
                        .cornerRadius(8)
                        Spacer()
                    }
                    HStack {
                        HStack {
                            Text("30 Contributors")
                                .font(.custom("Poppins-Medium", size: 8))
                                .foregroundColor(Color(hex: "#fff"))
                                .padding([.vertical],5)
                                .frame(width:110)
                        }
                        .background(Color(hex: "3A3A3A"))
                        .cornerRadius(8)
                        Spacer()
                    }
                }
            }.padding(.leading, 10)
            VStack {
                Image("dashboardArrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:20, height: 20)
                    .padding(.top, 30)
                Spacer()
            }
            .padding(.trailing,10)
        }.frame(width: UIScreen.main.bounds.width - 50, height: 100)
        .background(Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 110)
                        .cornerRadius(10)
                        .shadow(radius: 0 )
                        )
    }
}

struct NearbyCard_Previews: PreviewProvider {
    static var previews: some View {
        NearbyCard()
    }
}
