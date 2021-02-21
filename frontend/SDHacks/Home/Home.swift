//
//  Home.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Home: View {
    @Binding var login : Bool
    @Binding var map : Bool
    var body: some View {
        ZStack {
            Dashboard()
            GardenMap(map: $map)
                .offset(y: map ? 0 : 1000)
                .offset(y: login ? -1000 : 0)
            Onboarding(login: $login, map: $map)
                .offset(y: login ? 0 : -1000)
        }.animation(.easeInOut)
    }
}
