//
//  HeaderBar.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct DashboardHead: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Welcome to:")
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    DropDown()
                    Spacer()
                }
                Spacer()
            }.padding(.leading, 25)
            Spacer()
            VStack {
                HStack{
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Image("dashboardSearch")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18)
                        }
                    }.padding(.trailing, 5)
                    NavigationLink(destination: Blueprint()) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Image("dashboardMap")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18)
                        }
                    }
                }.padding(.trailing, 25)
                Spacer()
            }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct HeaderBar_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHead()
    }
}
