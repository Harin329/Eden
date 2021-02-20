//
//  GardenMap.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//
import SwiftUI
import MapKit

struct GardenMap: View {
    @State private var search: String = ""
    
    var body: some View {
        ZStack {
            MapView()
            VStack {
                HStack {
                    Text("Select your garden(s):")
                    Spacer()
                }.padding(.top, 70)
                .padding(.leading, 40)
                SearchBar(text: $search)
                    .padding(.horizontal,20)
                    .padding(.top, 10)
                Spacer()
            }
        }
    }
}
