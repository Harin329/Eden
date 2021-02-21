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
                
                NavigationLink(destination: Onboarding1(login: $login, map: $map)) {
                    Image("ob0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }.offset(x: 130, y: 280)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }.accentColor( Color(hex: "#255359"))
    }
}

struct Onboarding1: View {
    @Binding var login: Bool
    @Binding var map: Bool

    var body: some View {
            ZStack {
               Image("onboarding1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .offset(y: 0)
                
                NavigationLink(destination: Onboarding2(login: $login, map: $map)) {
                    Image("ob1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72)
                }.offset(x: 130, y: 275)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct Onboarding2: View {
    @Binding var login: Bool
    @Binding var map: Bool

    var body: some View {
            ZStack {
               Image("onboarding2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .offset(y: 0)
                
                Button(action: {
                    login = false
                    map = true
                }) {
                    Image("ob2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72)
                }.offset(x: 125, y: 275)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

