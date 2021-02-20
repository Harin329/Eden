//
//  Signup.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Signup: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @Binding var login: Bool

    var body: some View {
        VStack {
            Image("fridgeSpace2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Email", text: $email)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("    Password", text: $password)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("    Confirm Password", text: $password2)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            NavigationLink(destination: Name(login: $login)) {
                HStack {
                    Text("Sign up")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 20)
            
            Spacer()
        }
    }
}

struct Name: View {
    @State private var name: String = ""
    @Binding var login: Bool

//    @Binding var login: Bool

    var body: some View {
        VStack {
            Image("fridgeSpace2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Name", text: $name)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            NavigationLink(destination: Skill(login: $login)) {
                HStack {
                    Text("Next")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 20)
            
            Spacer()
        }
    }
}

struct Skill: View {
    @State private var selectedStrength = "Mild"
    @Binding var login: Bool

    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        VStack {
            Image("fridgeSpace2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)
            Text("Pick ur level")
            Picker("Strength", selection: $selectedStrength) {
                ForEach(strengths, id: \.self) {
                    Text($0)
                }
            }
            
            NavigationLink(destination: Postal(login: $login)) {
                HStack {
                    Text("Next")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 20)
            
            Spacer()
        }
    }
}

struct Postal: View {
    @State private var postal: String = ""
    @Binding var login: Bool

    var body: some View {
        VStack {
            Image("fridgeSpace2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Postal", text: $postal)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button(action: {
                self.login = false
            }) {
                HStack {
                    Text("Next")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 20)
            
            Spacer()
        }
    }
}
