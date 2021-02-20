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
                    Image("person1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
                Spacer()
                VStack {
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
                Spacer()
                VStack {
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
            }
            HStack {
                VStack {
                    Image("person1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
                Spacer()
                VStack {
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
                Spacer()
                VStack {
                    Image("person2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 85)
                    Text("Username")
                }
            }
        }.frame(width: UIScreen.main.bounds.width - 50)
    }
}

struct RecentContributors_Previews: PreviewProvider {
    static var previews: some View {
        RecentContributors()
    }
}
