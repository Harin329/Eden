//
//  Onboarding.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Onboarding: View {
    @Binding var login: Bool
    @Binding var map: Bool

    var body: some View {
        NavigationView {
            ZStack {
               Image("onboarding0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .offset(y: -87)
                
                NavigationLink(destination: VStack{}) {
                    Image("ob0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .offset(x: 100, y: 100)
                }
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }.accentColor( Color(hex: "#255359"))
    }
}


