//
//  Plant.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI


struct Plant: View {
    var plantInfo: PlantType
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var reportMsg = false
    
    var body: some View {
        ZStack {
            Color("F4F1EF")
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
                        Button(action: {
                            reportMsg = true
                        }) {
                            Image("Report")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.trailing, 25)
                        }
                    }.padding(.bottom, 10)
                    HStack {
                        Image("Water")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 25)
                        Image("Fertilize")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 10)
                        Image("Trim")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 10)
//                        Image("Harvest")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 30, height: 30)
//                            .padding(.leading, 10)
                        Spacer()
                    }.padding(.bottom, 10)
                    HStack {
                        VStack {
                            HStack {
                                Text("#" + String(plantInfo.PlantID))
                                    .font(.custom("Poppins-Regular", size: 13))
                                    .foregroundColor(Color(hex: "848484"))
                                Spacer()
                            }.padding(.bottom, 1)
                            HStack {
                                Text(plantInfo.PlantName)
                                    .font(.custom("Poppins-Medium", size: 23))
                                    .foregroundColor(Color(hex: "3a3a3a"))
                                Spacer()
                            }.padding(.bottom, 3)
                            HStack {
                                Text(plantInfo.PlantType)
                                    .font(.custom("Poppins-Regular", size: 15))
                                    .foregroundColor(Color(hex: "848484"))
                                Spacer()
                            }
                        }.padding(.leading, 25)
                        Spacer()
                        VStack {
                            HStack {
                                Button(action: {}) {
                                    Text("64 contributors")
                                        .font(.custom("Poppins-Medium", size: 10))
                                        .foregroundColor(Color(hex: "848484"))
                                        .padding(.all, 5)
                                        .padding(.horizontal, 5)
                                }.background(RoundedRectangle(cornerRadius: 3)
                                                .stroke(Color(hex:"848484"))
                                                )
                            
                            }
                        }.padding(.trailing, 25)
                    }.padding(.bottom, 10)
                    HStack {
                        Image(plantInfo.PlantType + " Wiki")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 190, height: 190)
                        .cornerRadius(5)
                        .padding(.leading, 25)
                        Spacer()
                        VStack {
                            HStack {
                                Image("Days")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .padding(.leading, 10)
                                VStack {
                                    HStack {
                                        Text("30")
                                            .font(.custom("Poppins-Medium", size: 13))
                                            .foregroundColor(Color(hex: "68C883"))
                                        Spacer()
                                    }
                                    HStack{
                                        Text("Days")
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .foregroundColor(Color(hex: "3a3a3a"))
                                        Spacer()
                                    }
                                }.frame(minWidth: 0, maxWidth: 90, alignment: .trailing)
                                .padding(.trailing, 25)
                            }.padding(.bottom)
                            HStack {
                                Image("Height")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .padding(.leading, 10)
                                VStack {
                                    HStack {
                                        Text("12 cm")
                                            .font(.custom("Poppins-Medium", size: 13))
                                            .foregroundColor(Color(hex: "68C883"))
                                        Spacer()
                                    }
                                    HStack{
                                        Text("Height")
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .foregroundColor(Color(hex: "3a3a3a"))
                                        Spacer()
                                    }
                                }.frame(minWidth: 0, maxWidth: 90, alignment: .trailing)
                                .padding(.trailing, 25)
                            }.padding(.bottom)
                            HStack {
                                Image("WaterLevel")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .padding(.leading, 10)
                                VStack {
                                    HStack {
                                        Text("Medium")
                                            .font(.custom("Poppins-Medium", size: 13))
                                            .foregroundColor(Color(hex: "68C883"))
                                        Spacer()
                                    }
                                    HStack{
                                        Text("Water")
                                            .font(.custom("Poppins-Regular", size: 13))
                                            .foregroundColor(Color(hex: "3a3a3a"))
                                        Spacer()
                                    }
                                }.frame(minWidth: 0, maxWidth: 90, alignment: .trailing)
                                .padding(.trailing, 25)
                            }
                        }
                    }.background(Rectangle()
                                    .fill(Color("F4F1EF"))
                                    )
                    HStack {
                        NavigationLink(destination: Contribution(plantInfo: plantInfo)) {
                            Text("Help me grow")
                                .font(.custom("Poppins-Medium", size: 13))
                                .foregroundColor(Color(hex: "fff"))
                                .padding(.vertical, 10)
                                .frame(width: 190)
                        }
                        .background(Color(hex: "#3A3A3A"))
                        .cornerRadius(5)
                        .padding(.top, 20)
                        Spacer()
                    }.padding(.leading, 25)
                    Spacer()
                    PlantDescription()
                        .animation(.easeIn)
                        .padding(.top, 30)
                }
                .padding(.top, 0)
                .background(Rectangle()
                                .fill(Color("F4F1EF"))
                                )
            }.background(Color("F4F1EF"))
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            if reportMsg {
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                                .edgesIgnoringSafeArea(.all)
                Report(report: $reportMsg)
            }
        }.animation(.spring())
    }
}

//struct Plant_Previews: PreviewProvider {
//    static var previews: some View {
//        Plant()
//    }
//}
