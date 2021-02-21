//
//  ContributionConfirmation.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import UIKit
import SwiftUI


struct ContributionConfirmation: View {
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
            HStack {
                Text("Harin").fontWeight(.medium).padding(.leading, 25).padding(.top, 10).foregroundColor(Color(hex: "#C4C4C4"))
                Spacer()
            }
            HStack {
                Text("You contributed by:").font(.system(size: 24)).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            VStack {
                Image(uiImage: self.contributionImage)
                               .resizable()
                                .aspectRatio(contentMode: .fit)
                               .frame(width: 300, height: 300)
                               .edgesIgnoringSafeArea(.all)
            }
            HStack {
                Text(contributeType + " at Allen School").font(.system(size: 24)).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            HStack {
                Text("on").font(.system(size: 12)).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            HStack {
                Text("Feb 21, 2021").font(.system(size: 24)).padding(.leading, 25).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            HStack {
                Spacer()
                NavigationLink(destination: Thanks(plantInfo: plantInfo, contributeType: contributeType, contributeDate: contributeDate, contributionImage: image)) {
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

//struct ContributionConfirmation_Previews: PreviewProvider {
//    static var previews: some View {
//        ContributionConfirmation()
//    }
//}

