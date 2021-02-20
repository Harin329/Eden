//
//  Home.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Home: View {
    @State var login = false
    var body: some View {
        if login {
            Onboarding(login: $login)
        }
        else {
            GardenMap()

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
