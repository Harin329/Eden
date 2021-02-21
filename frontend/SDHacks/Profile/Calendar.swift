//
//  Calendar.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-21.
//

import SwiftUI

struct Calendar: View {
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
                    }.padding(.leading, 25).padding(.top, 30)
                    Spacer()
                }.padding(.bottom, 10)
                HStack {
                    VStack {
                        Text("Harin's Monthly").font(.system(size: 16)).foregroundColor(Color(hex: "#C4C4C4")).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                        Text("Greenhouse").font(.system(size: 20)).padding(.leading, 25).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                    }
                    Image("harin")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    
                }.padding(.top, 20)
                HStack {
                    Image("BigCal")
                                   .resizable()
                                    .aspectRatio(contentMode: .fit)
                                   .frame(width: 329, height: 329)
                                   .edgesIgnoringSafeArea(.all)
                }.padding(.top, 30)
                HStack {
                    Button(action:{}) {
                        Text("8 Contributions")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }.padding(.leading, 25)
                    Spacer()
                }.padding(.top, 30)
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("Trim")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                            .padding(.all, 5)
                        Text("2 times")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#848484"))
                            .fontWeight(.medium)
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .frame(width: 200, alignment: .trailing)
                    }.background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex:"848484")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("Water")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                            .padding(.all, 5)
                        Text("3 times")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#848484"))
                            .fontWeight(.medium)
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .frame(width: 200, alignment: .trailing)
                    }.background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex:"848484")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("Harvest")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                            .padding(.all, 5)
                        Text("1 time")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#848484"))
                            .fontWeight(.medium)
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .frame(width: 200, alignment: .trailing)
                    }.background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex:"848484")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("Fertilize")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                            .padding(.all, 5)
                        Text("2 times")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#848484"))
                            .fontWeight(.medium)
                            .padding(.all, 5)
                            .padding(.horizontal, 5)
                            .frame(width: 200, alignment: .trailing)
                    }.background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex:"848484")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                }.padding(.top, 30).padding(.bottom, 100)
                
                Spacer()
            }
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
