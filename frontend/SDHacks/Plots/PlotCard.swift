//
//  PlotCard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlotCard: View {
    var body: some View {
        NavigationLink(destination: VStack{}) { // direct Plant Profile
            VStack {
                Image("dashboard2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                    .clipped()
                HStack {
                    Circle()
                        .fill(Color(hex: "D8E8F1"))
                        .frame(width: 22, height: 22)
                    Circle()
                        .fill(Color(hex: "DECBF0"))
                        .frame(width: 22, height: 22)
                    Circle()
                        .fill(Color(hex: "FADDDD"))
                        .frame(width: 22, height: 22)
                    Spacer()
                    Image("dashboardPeople")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12)
                        .offset(x: 5)
                    Text("67")
                        .foregroundColor(Color(hex: "C1C1C1"))
                        .font(.system(size: 10))
                        .bold()
                        .padding(0)
                }.padding(.bottom, 3)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                HStack {
                    Text("Flynn")
                    Spacer()
                }
                .padding(.leading, 10)
                HStack {
                    Text("#P12334")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "757575"))
                    Spacer()
                }
                .padding(.leading, 10)
                
                HStack {
                    Text("Last updated: 02/20/2021")
                        .font(.system(size: 11))
                        .foregroundColor(Color(hex: "757575"))
                    Spacer()
                }.padding(.leading, 10)
                .padding(.bottom, 15)
            }.frame(width: 150)
            .background(Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5 )
                            .frame(width: 150)
            )
        }
    }
}

struct PlotCard_Previews: PreviewProvider {
    static var previews: some View {
        PlotCard()
    }
}
