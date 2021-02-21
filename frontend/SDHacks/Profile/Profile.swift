//
//  Profile.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Harin's").font(.system(size: 16)).foregroundColor(Color(hex: "#C4C4C4")).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                    Text("Greenhouse").font(.system(size: 20)).padding(.leading, 25).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                }
                Image("harin")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            }.padding(.top, 50)
            HStack {
                Button(action:{}) {
                    Text("Saved Plants")
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                }.padding(.trailing, 20)
                Spacer()
                NavigationLink(destination: Plots()) {
                    Text("See all")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
            }
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
