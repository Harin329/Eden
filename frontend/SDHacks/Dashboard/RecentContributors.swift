//
//  RecentContributors.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct RecentContributors: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent Contributors")
                    .font(.system(size: 26))
                Spacer()
            }.padding(.bottom, 20)
            HStack {
                VStack {
                    Image("harin")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                        .cornerRadius(85)
                    Text("Harin W")
                }
                Spacer()
                VStack {
                    Image("jenny")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Jenny C")
                }
                Spacer()
                VStack {
                    Image("sophia")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Sophia C")
                }
            }
            HStack {
                VStack {
                    Image("victor")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Victor U")
                }
                Spacer()
                VStack {
                    Image("person1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Mikayla L")
                }
                Spacer()
                VStack {
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                        .cornerRadius(85)
                    Text("Pierce H")
                }
            }.padding(.bottom, 100)
        }.frame(width: UIScreen.main.bounds.width - 50)
    }
}

struct RecentContributors_Previews: PreviewProvider {
    static var previews: some View {
        RecentContributors()
    }
}
