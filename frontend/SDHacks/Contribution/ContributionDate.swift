//
//  ContributionDate.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI

struct ContributionDate: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var date: Date = Date()
    var plantInfo: PlantType
    var contributeType: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        HStack {
                        Image("Back") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        }
                }.padding(.leading, 25).padding(.top, 30)
                Spacer()
            }.padding(.bottom, 10)
            HStack {
                Text("Amazing!")
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
                DatePicker("Date", selection: $date).datePickerStyle(WheelDatePickerStyle()).frame(height: 50).padding(.all, 80)
            }.padding(.top, 30)
            HStack {
                Spacer()
                NavigationLink(destination: ContributionCamera(plantInfo: plantInfo, contributeType: contributeType, contributeDate: date)) {
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
//
//struct ContributionDate_Previews: PreviewProvider {
//    static var previews: some View {
//        ContributionDate()
//    }
//}
