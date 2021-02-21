//
//  PlantCard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct PlantCard: View {
    var plantInfo: PlantType
    
    
    var body: some View {
        NavigationLink(destination: Plant(plantInfo: plantInfo)) {
            VStack {
                Image(self.plantInfo.PlantType)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                    .clipped()
                HStack {
                    Circle()
                        .fill(Color(hex: "D8E8F1"))
                        .frame(width: 25, height: 25)
                    Circle()
                        .fill(Color(hex: "DECBF0"))
                        .frame(width: 25, height: 25)
                    Circle()
                        .fill(Color(hex: "FADDDD"))
                        .frame(width: 25, height: 25)
                    Spacer()
                    Image("dashboardPeople")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                        .offset(x: 5)
                    Text("67")
                        .foregroundColor(Color(hex: "C1C1C1"))
                        .font(.system(size: 12))
                        .bold()
                        .padding(0)
                }.padding(.bottom, 3)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                HStack {
                    Text(String(self.plantInfo.PlantName))
                    Spacer()
                }.padding(.bottom, 1)
                .padding(.leading, 10)
                HStack {
                    Text("#" + String(self.plantInfo.PlantID))
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

//struct PlantCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantCard()
//    }
//}
