//
//  GardenList.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct GardenList: View {
    @Binding var gardenList : [Garden]
    @Binding var showList: Bool
    @Binding var map : Bool
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    if showList {
                        showList = false
                    }
                }) {
                    if showList {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color(hex: "c4c4c4"))
                    }
                    else {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color(hex: "c4c4c4"))

                    }
                }
                Spacer()
            }
            HStack {
                Text("Selected gardens:")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color(hex: "3a3a3a"))
                Spacer()
            }
            .frame(width: 290)
            .padding()
            ForEach(gardenList, id: \.id) { garden in
                GardenListCard(garden: garden)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    map = false
                }) {
                    HStack {
                        Text("Done")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],10)
                            .frame(width:130)
                    }.background(Color(hex: "#3a3a3a"))
                }
                .cornerRadius(10)
                .padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 450)
        .padding(.top)
        .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
    }
}

struct GardenListCard: View {
    var garden: Garden
    var body: some View {
        HStack {
            Image(garden.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90, alignment: .center)
            VStack {
                HStack {
                    Text(garden.name)
                        .font(.custom("Poppins-SemiBold", size: 13))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                }.padding(.bottom, 1)
                HStack {
                    Text(garden.address)
                        .font(.custom("Poppins-Regular", size: 9))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            }.padding(.vertical, 5)
            Spacer()
            VStack{
                Image(systemName: "multiply")
                    .font(.system(size: 10))
                Spacer()
            }.frame(height: 80)
            .padding(.trailing, 5)
        }.frame(width: 290)
        .background(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(hex:"e4e4e4")))
        .padding(.bottom, 7)
    }
}

