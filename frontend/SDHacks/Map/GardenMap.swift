//
//  GardenMap.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//
import SwiftUI
import GoogleMaps

struct GardenMap: View {
    @State private var search: String = ""
    @State var gardens = [Garden(name: "Golden Hill Community Garden", address: "Address: 2440 Russ Blvd. San Diego 92102 ", latitude: 32.731466, longitude: -117.147076, zoom: 13.0), Garden(name: "Smarts Farm Garden", address: "Address: 2440 Russ Blvd. San Diego 92102 ", latitude: 32.752228, longitude: -117.134545, zoom: 15.0),Garden(name: "The Villiage Community Garden", address: "Address: 2440 Russ Blvd. San Diego 92102 ", latitude: 32.758719, longitude: -117.190713, zoom: 15.0),Garden(name: "Intergen Garden", address: "Address: 2440 Russ Blvd. San Diego 92102 ", latitude: 32.708882, longitude: -117.156953, zoom: 15.0)]
    @State var selectedGarden: Garden?
    @State var showList = false
    @State var selectedGardens: [Garden] = []
    @Binding var map: Bool
    var body: some View {
        ZStack {
            MapView(gardens: $gardens, selectedGarden: $selectedGarden)
            if selectedGarden == nil {
                VStack {
                    HStack {
                        Text("Select your garden(s):")
                            .font(.custom("Poppins-Regular", size: 20))
                        Spacer()
                    }.padding(.top, 70)
                    .padding(.leading, 40)
                    SearchBar(text: $search)
                        .padding(.horizontal,20)
                        .padding(.top, 10)
                    Spacer()
                    ZStack {
                        GardenList(gardenList: $selectedGardens, showList: $showList, map: $map)
                        if !showList {
                            Button(action: {
                                showList = true
                            }) {
                                Rectangle()
                                    .fill(Color.white)
                                    .opacity(0.1)
                                    .frame(height:460)
                            }
                        }
                    }.offset(y: showList ? 0 : 410)
                }
            }
            else {
                ZStack {
                    Button (action: {
                        selectedGarden = nil
                    }) {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.1)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    }
                    VStack {
                        VStack {
                            HStack {
                                Image("pin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .rotationEffect(.degrees(45))
                                Spacer()
                            }
                            HStack {
                                Text(selectedGarden!.name)
                                    .font(.custom("Poppins-SemiBold", size: 13))
                                    .foregroundColor(Color(hex: "3a3a3a"))
                                    .padding(.bottom, 1)
                                Spacer()
                            }
                            HStack {
                                Text(selectedGarden!.address)
                                    .font(.custom("Poppins-Regular", size: 11))
                                    .foregroundColor(Color(hex: "3a3a3a"))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.trailing, 10)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        selectedGardens.append(selectedGarden!)
                                        selectedGarden = nil
                                    }) {
                                        HStack {
                                            Text("Add")
                                                .font(.custom("Poppins-SemiBold", size: 12))
                                                .foregroundColor(Color(hex: "#fff"))
                                                .padding([.vertical],10)
                                                .frame(width:100)
                                        }.background(Color(hex: "#3a3a3a"))
                                    }.cornerRadius(10)
                                }
                            }
                        }.padding()
                        .frame(width: 270)
                        .background(Rectangle()
                                        .fill(Color.white)
                                        .cornerRadius(10))
                        .padding(.top, 150)
                        Spacer()
                    }
                }
            }
        }.animation(.easeInOut)
    }
}
