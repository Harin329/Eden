//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI

struct PlantType: Codable, Hashable {
    var PlantID: Int
    var GardenID: Int
    var PlotID: Int
    var PlantType: String
    var PlantName: String
    var Instruction: String
}

struct Plant: View {
    var plantInfo: PlantType
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                            Image("Back") // set image here
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                            }
                    }.padding(.leading, 25)
                    Spacer()
                    Image("Report")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 25)
                }.padding(.bottom, 10)
                HStack {
                    Image("Water")
                        .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                        .padding(.leading, 25)
                    Image("Fertilize")
                        .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                        .padding(.leading, 10)
                    Image("Trim")
                        .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                        .padding(.leading, 10)
                    Image("Harvest")
                        .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                        .padding(.leading, 10)
                    Spacer()
                }.padding(.bottom, 10)
                HStack {
                    VStack {
                        HStack {
                            Text("#" + String(plantInfo.PlantID)).font(.system(size: 14)).foregroundColor(Color(hex: "#848484"))
                            Spacer()
                        }.padding(.bottom, 1)
                        HStack {
                            Text(plantInfo.PlantName).font(.system(size: 25)).foregroundColor(Color(hex: "#3A3A3A")).fontWeight(.medium)
                            Spacer()
                        }.padding(.bottom, 3)
                        HStack {
                            Text(plantInfo.PlantType).font(.system(size: 18)).foregroundColor(Color(hex: "#848484"))
                            Spacer()
                        }
                    }.padding(.leading, 25)
                    Spacer()
                    VStack {
                        HStack {
                            Button(action: {}) {
                                Text("64 contributors")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "#848484"))
                                    .fontWeight(.medium)
                                    .padding(.all, 5)
                                    .padding(.horizontal, 5)
                            }.background(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(hex:"848484"))
                                            )
                        
                        }
                    }.padding(.trailing, 25)
                }.padding(.bottom, 10)
                HStack {
                    Image(plantInfo.PlantType)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipped()
                    Spacer()
                    VStack {
                        HStack {
                            Image("Harvest")
                                .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                                .padding(.leading, 10)
                            VStack {
                                HStack {
                                    Text("30").font(.system(size: 14)).foregroundColor(Color(hex: "#68C883")).fontWeight(.medium)
                                    Spacer()
                                }
                                HStack{
                                    Text("Days").font(.system(size: 14)).foregroundColor(Color(hex: "#3A3A3A")).fontWeight(.medium)
                                    Spacer()
                                }
                            }.frame(minWidth: 0, maxWidth: 80, alignment: .trailing)
                            .padding(.trailing, 30)
                        }.padding(.bottom)
                        HStack {
                            Image("Harvest")
                                .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                                .padding(.leading, 10)
                            VStack {
                                HStack {
                                    Text("12 cm").font(.system(size: 14)).foregroundColor(Color(hex: "#68C883")).fontWeight(.medium)
                                    Spacer()
                                }
                                HStack{
                                    Text("Height").font(.system(size: 14)).foregroundColor(Color(hex: "#3A3A3A")).fontWeight(.medium)
                                    Spacer()
                                }
                            }.frame(minWidth: 0, maxWidth: 80, alignment: .trailing)
                            .padding(.trailing, 30)
                        }.padding(.bottom)
                        HStack {
                            Image("Harvest")
                                .frame(minWidth: 0, maxWidth: 30, alignment: .leading)
                                .padding(.leading, 10)
                            VStack {
                                HStack {
                                    Text("Medium").font(.system(size: 14)).foregroundColor(Color(hex: "#68C883")).fontWeight(.medium)
                                    Spacer()
                                }
                                HStack{
                                    Text("Water").font(.system(size: 14)).foregroundColor(Color(hex: "#3A3A3A")).fontWeight(.medium)
                                    Spacer()
                                }
                            }.frame(minWidth: 0, maxWidth: 80, alignment: .trailing)
                            .padding(.trailing, 30)
                        }
                    }
                }
                HStack {
                    Button(action: {}, label: {
                        Text("Help me grow")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 28)
                    })
                    .background(Color(hex: "#3A3A3A"))
                    .cornerRadius(10)
                    Spacer()
                }.padding(.leading, 30)
                Spacer()
                PlantDescription()
                    .animation(.easeIn)
                    .padding(.top, 30)
            }
            .padding(.top, 40)
            .background(Color.white)
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

//struct Plant_Previews: PreviewProvider {
//    static var previews: some View {
//        Plant()
//    }
//}
