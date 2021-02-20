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
                    }
                    else {
                        Image(systemName: "chevron.up")
                    }
                }
                Spacer()
            }
            HStack {
                Text("Selected gardens:")
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
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],10)
                            .frame(width:130)
                    }.background(Color(hex: "#255359"))
                }
                .cornerRadius(30)
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
            Rectangle()
                .frame(width: 70, height: 70, alignment: .center)
            VStack {
                HStack {
                    Text(garden.name)
                        .bold()
                    Spacer()
                }.padding(.bottom, 3)
                HStack {
                    Text(garden.address)
                        .font(.caption)
                    Spacer()
                }
            }
            Spacer()
            VStack{
                Image(systemName: "multiply")
                    .font(.system(size: 10))
                Spacer()
            }.frame(height: 60)
            .padding(.trailing, 5)
        }.frame(width: 290)
        .background(Rectangle().fill(Color.gray).opacity(0.3))
    }
}

