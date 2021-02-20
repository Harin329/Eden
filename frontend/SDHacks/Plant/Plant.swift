//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI

struct Plant: View {
    var body: some View {
        VStack {
            HStack {
                Image("Back")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                Spacer()
                Image("Report")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
            }.padding(.bottom, 10)
            HStack {
                Image("Water")
                    .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                    .padding(.leading, 30)
                Image("Fertilize")
                    .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                    .padding(.leading, 10)
                Image("Trim")
                    .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                    .padding(.leading, 10)
                Image("Harvest")
                    .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                    .padding(.leading, 10)
                Spacer()
            }.padding(.bottom, 10)
            HStack {
                VStack {
                    HStack {
                        Text("#F1256").font(.system(size: 14)).foregroundColor(Color(hex: "#848484"))
                        Spacer()
                    }.padding(.bottom, 1)
                    HStack {
                        Text("Julie").font(.system(size: 25)).foregroundColor(Color(hex: "#3A3A3A")).fontWeight(.medium)
                        Spacer()
                    }.padding(.bottom, 3)
                    HStack {
                        Text("Snake Plant").font(.system(size: 18)).foregroundColor(Color(hex: "#848484"))
                        Spacer()
                    }
                }.padding(.leading, 30)
                Spacer()
                VStack {
                    Text("64 contributors").font(.system(size: 16)).foregroundColor(Color(hex: "#848484")).fontWeight(.medium).padding(.all, 5).border(Color(hex: "#848484"), width: 3).cornerRadius(10)
                }.padding(.trailing, 30)
            }.padding(.bottom, 10)
            Text("Image and Info")
            Text("Help it grow")
            Spacer()
            Text("Help it")
        }
        
    }
}

struct Plant_Previews: PreviewProvider {
    static var previews: some View {
        Plant()
    }
}
