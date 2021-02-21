//
//  Contribution.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Contribution: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var plantInfo: PlantType
    
    var body: some View {
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
                Text("Hello Harin,")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color(hex: "c4c4c4"))
                    .padding(.leading, 25)
                    .padding(.top, 20)
                Spacer()
            }
            HStack {
                Text("How would you like to contribute today?")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundColor(Color(hex: "3a3a3a"))
                    .padding(.leading, 25)
                    .padding(.top, 5)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            VStack {
                NavigationLink(destination: ContributionDate(plantInfo: plantInfo, contributeType: "Trim")) {
                    Image("Trim")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                        .padding(.all, 5)
                    Text("Prune")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .padding(.all, 5)
                        .padding(.horizontal, 5)
                        .frame(width: 200, alignment: .trailing)
                }.background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex:"e9e9e9")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                )
                NavigationLink(destination: ContributionDate(plantInfo: plantInfo, contributeType: "Water")) {
                    Image("Water")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                        .padding(.all, 5)
                    Text("Water")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .padding(.all, 5)
                        .padding(.horizontal, 5)
                        .frame(width: 200, alignment: .trailing)
                }.background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex:"e9e9e9")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                )
                NavigationLink(destination: ContributionDate(plantInfo: plantInfo, contributeType: "Harvest")) {
                    Image("Harvest")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                        .padding(.all, 5)
                    Text("Harvest")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .padding(.all, 5)
                        .padding(.horizontal, 5)
                        .frame(width: 200, alignment: .trailing)
                }.background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex:"e9e9e9")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                )
                NavigationLink(destination: ContributionDate(plantInfo: plantInfo, contributeType: "Fertilize")) {
                    Image("Fertilize")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: 50, alignment: .leading)
                        .padding(.all, 5)
                    Text("Fertilize")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(Color(hex: "3a3a3a"))
                        .padding(.all, 5)
                        .padding(.horizontal, 5)
                        .frame(width: 200, alignment: .trailing)
                }.background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex:"e9e9e9")).frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                )
            }.padding(.top, 30)
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("Next")
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(Color(hex: "fff"))
                        .padding(.vertical, 12)
                        .frame(width: 100)
                }
                .background(Color(hex: "#3A3A3A"))
                .cornerRadius(5)
                .padding(.top, 30)
                .padding(.trailing, 30)
            }
            Spacer()
        
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct Contribution_Previews: PreviewProvider {
//    static var previews: some View {
//        Contribution()
//    }
//}
