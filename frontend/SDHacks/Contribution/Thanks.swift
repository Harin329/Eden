//
//  Thanks.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import SwiftUI

struct Thanks: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var plantInfo: PlantType
    var contributeType: String
    var contributeDate: Date
    var contributionImage: UIImage
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    HStack {
                        Image("Back") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }
                }.padding(.leading, 25).padding(.top, 10)
                Spacer()
            }.padding(.bottom, 10)
            VStack {
                Image("Thanks")
                               .resizable()
                                .aspectRatio(contentMode: .fit)
                               .frame(width: 300, height: 300)
                               .edgesIgnoringSafeArea(.all)
            }
            HStack {
                Spacer()
                Button(action: {
                    let df = DateFormatter()
                    let df2 = DateFormatter()
                    df.dateFormat = "yyyy-MM-dd"
                    df2.dateFormat = "hh:mm:ss"
                    
                    let cont = ContributionType(UserID: 1, GardenID: self.plantInfo.GardenID, PlotID: self.plantInfo.PlotID, PlantID: self.plantInfo.PlantID, Date: df.string(from: self.contributeDate) + "T" + df2.string(from: self.contributeDate) + "-00:00", ContributionType: self.contributeType)
                    PlantEndpoints.createContribution(contribution: cont)
                }) {
                    Text("Confirm")
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
            
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct Thanks_Previews: PreviewProvider {
//    static var previews: some View {
//        Thanks()
//    }
//}

