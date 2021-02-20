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
    @State var gardens = [Garden(name: "Garden 1", address: "111 garden lane", latitude: 32.7057, longitude: -117.1711), Garden(name: "Garden 2", address: "222 garden lane", latitude: 32.7257, longitude: -117.1511)]
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
                                Text(selectedGarden!.name)
                                    .bold()
                                    .padding(.bottom, 5)
                                Spacer()
                            }
                            HStack {
                                Text(selectedGarden!.address)
                                    .font(.caption)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 110)
                                    .padding(.trailing, 10)
                                VStack {
                                    Button(action: {}) {
                                        HStack {
                                            Text("Directions")
                                                .font(.caption2)
                                                .foregroundColor(Color(hex: "#fff"))
                                                .padding([.vertical],10)
                                                .frame(width:100)
                                        }.background(Color(hex: "#255359"))
                                    }.cornerRadius(10)
                                }
                            }
                        }.padding()
                        .frame(width: 250)
                        .background(Rectangle()
                                        .fill(Color.white)
                                        .cornerRadius(10))
                        .padding(.top, 150)
                        Spacer()
                        Button(action: {
                            selectedGardens.append(selectedGarden!)
                            selectedGarden = nil
                        }) {
                            HStack {
                                Text("Select")
                                    .foregroundColor(Color(hex: "#fff"))
                                    .padding([.vertical],20)
                                    .frame(width:220)
                            }.background(Color(hex: "#255359"))
                        }
                        .cornerRadius(30)
                        .padding(.bottom, 80)
                    }
                }
            }
        }.animation(.easeInOut)
    }
}
