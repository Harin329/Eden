//
//  Plots.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Plots: View {
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
                    VStack {
                        HStack{
                            Button(action: {}) {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "EEF4EF"))
                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Image("dashboardSearch")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 18)
                                }
                            }.padding(.trailing, 5)
                            Button(action: {}) {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "EEF4EF"))
                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Image("dashboardMap")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 18)
                                }
                            }
                        }.padding(.trailing, 25)
                        Spacer()
                    }
                }.frame(height: 50)
                HStack {
                    Text("Plants")
                        .font(.system(size: 26))
                        .foregroundColor(Color(hex: "3A3A3A"))
                    Spacer()
                }.padding(.leading, 25)
                HStack {
                    PlotCard()
                    Spacer()
                    PlotCard()
                }.padding(.horizontal, 25)
                HStack {
                    PlotCard()
                    Spacer()
                    PlotCard()
                }.padding(.horizontal, 25)
                HStack {
                    PlotCard()
                    Spacer()
                }.padding(.horizontal, 25)
            }.padding(.bottom, 70)
            .padding(.top, 35)
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .frame(height: UIScreen.main.bounds.height)
        
    }
}

struct Plots_Previews: PreviewProvider {
    static var previews: some View {
        Plots()
    }
}
