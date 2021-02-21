//
//  Blueprint.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-21.
//

import SwiftUI

struct Blueprint: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                VStack {
                    HStack {
                    Text("Map View").font(.system(size: 20)).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                    Text("Allen School")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#848484"))
                        .fontWeight(.medium)
                        .frame(maxWidth: 300, alignment: .leading)
                        Spacer()
                    }
                }.padding(.leading, 25)
                
            }.padding(.top, 5)
            HStack {
                Image("Blueprint")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 329, height: 500)
                    .edgesIgnoringSafeArea(.all)
            }.padding(.top, 20)
            Spacer()
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Blueprint_Previews: PreviewProvider {
    static var previews: some View {
        Blueprint()
    }
}
