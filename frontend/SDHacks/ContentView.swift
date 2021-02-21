//
//  ContentView.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    @State var login = false
    @State var map = false
    var body: some View {
        ZStack {
            Home(login: $login, map: $map)
                .edgesIgnoringSafeArea(.all)
                .opacity(index == 0 ? 1 : 0)
            VStack{} //camera
                .opacity(index == 1 ? 1 : 0)
            VStack{} //profile
                .opacity(index == 2 ? 1 : 0)
            if !login && !map {
                MenuBar(index: $index).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
