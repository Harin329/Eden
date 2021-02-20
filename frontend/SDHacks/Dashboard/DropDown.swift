//
//  Dropdown.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct DropDown: View {
    
    @State var expand = false
    
    var body: some View {
        VStack() {
            VStack(spacing: 10) {
                HStack() {
                    Text("Golden Hill")
                        .fontWeight(.bold)
                        .font(.system(size: 26))
                        .foregroundColor(Color(hex: "73C597"))
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(Color(hex: "73C597"))
                    Spacer()
                }.onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    VStack {
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Text("Garden 1")
                                .font(.system(size: 22))
                                .padding(.vertical, 10)
                        }.foregroundColor(Color(hex: "3A3A3A"))
                        Divider().padding(.horizontal, 20)
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Text("Garden 2")
                                .font(.system(size: 22))
                                .padding(.vertical, 10)
                        }.foregroundColor(Color(hex: "3A3A3A"))
                        Divider().padding(.horizontal, 20)
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Text("Garden 3")
                                .font(.system(size: 22))
                                .padding(.vertical, 10)
                        }.foregroundColor(Color(hex: "3A3A3A"))
                        Divider().padding(.horizontal, 20)
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 22))
                                .padding(.vertical, 10)
                                .padding(.bottom, 10)
                        }.foregroundColor(Color(hex: "3A3A3A"))
                    }.background(Rectangle()
                                    .fill(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 3))
                }
            }
            .cornerRadius(0)
            .animation(.spring())
        }
    }
}
