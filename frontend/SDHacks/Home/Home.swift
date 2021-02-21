//
//  Home.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Home: View {
    @State var login = false
    @State var map = false
    var body: some View {
        ZStack {
//            Plant()
            Dashboard()
//            GardenMap(map: $map)
//                .offset(y: map ? 0 : 1000)
//                .offset(y: login ? -1000 : 0)
            Onboarding(login: $login, map: $map)
                .offset(y: login ? 0 : -1000)
        }.animation(.easeInOut)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
