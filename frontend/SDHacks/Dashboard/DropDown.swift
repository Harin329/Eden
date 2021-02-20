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
                }.onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Garden 1")
                            .font(.system(size: 26))
                            .padding(10)
                    }.foregroundColor(Color(hex: "73C597"))
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Garden 2")
                            .font(.system(size: 26))
                            .padding(10)
                    }.foregroundColor(Color(hex: "73C597"))
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Garden 3")
                            .font(.system(size: 26))
                            .padding(10)
                    }.foregroundColor(Color(hex: "73C597"))
                }
            }
            .cornerRadius(0)
            .animation(.spring())
        }
    }
}
