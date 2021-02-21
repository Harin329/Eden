//
//  ContributionDate.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI

struct ContributionDate: View {
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                        HStack {
                        Image("Back") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        }
                }.padding(.leading, 25).padding(.top, 30)
                Spacer()
            }.padding(.bottom, 10)
            HStack {
                Text("Amazing!").fontWeight(.medium).padding(.leading, 25).padding(.top, 20).foregroundColor(Color(hex: "#C4C4C4"))
                Spacer()
            }
            HStack {
                Text("How would you like to contribute today?").font(.system(size: 24)).padding(.leading, 25).padding(.top, 5).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            VStack {
                DatePicker("Date", selection: $date).datePickerStyle(WheelDatePickerStyle()).frame(height: 50).padding(.all, 80)
            }.padding(.top, 30)
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("Next")
                        .font(.system(size: 14))
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 12)
                        .frame(width: 100)
                }
                .background(Color(hex: "#3A3A3A"))
                .cornerRadius(5)
                .padding(.top, 30)
                .padding(.trailing, 30)
            }
            Spacer()
        
        }
    }
}

struct ContributionDate_Previews: PreviewProvider {
    static var previews: some View {
        ContributionDate()
    }
}
