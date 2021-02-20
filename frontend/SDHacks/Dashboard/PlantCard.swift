//
//  PlantCard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantCard: View {
    var body: some View {
        NavigationLink(destination: VStack{}) {
            VStack {
                Image("dashboard2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                    .clipped()
                HStack {
                    Circle()
                        .frame(width: 25, height: 25)
                    Circle()
                        .frame(width: 25, height: 25)
                    Circle()
                        .frame(width: 25, height: 25)
                    Spacer()
                    ZStack {
                        Image("dashboardPeople")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .offset(y: -5)
                        Text("67")
                            .foregroundColor(Color(hex: "434343"))
                            .font(.system(size: 10))
                            .padding(0)
                            .offset(y:7)
                    }
                    .frame(height: 25)
                }.padding(.bottom, 3)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                HStack {
                    Text("Flynn")
                    Spacer()
                }.padding(.bottom, 1)
                .padding(.leading, 10)
                HStack {
                    Text("#P12334")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "757575"))
                    Spacer()
                }.padding(.bottom, 1)
                .padding(.leading, 10)

                HStack {
                    Text("Last updated: 02/20/2021")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "757575"))
                    Spacer()
                }.padding(.leading, 10)
                .padding(.bottom, 15)
            }.frame(width: 180)
            .background(Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5 )
                            .frame(width: 180)
        )
        }
        
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var previews: some View {
        PlantCard()
    }
}
