//
//  Plots.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Plots: View {
    var body: some View {
        VStack {
            HStack {
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
            }
        }.offset(y:50)
    }
}

struct Plots_Previews: PreviewProvider {
    static var previews: some View {
        Plots()
    }
}
