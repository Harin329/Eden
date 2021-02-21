//
//  Camera.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-21.
//


import UIKit
import SwiftUI

struct Camera: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
//            Image("QR")
//                .resizable()
//                .background(Color.clear)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 329, height: 700)
//                .edgesIgnoringSafeArea(.all).padding(.top, -300)
//                .position(x: 0, y: 0)
            ImagePicker(selectedImage: self.$image, sourceType: .camera)
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

//struct Camera_Previews: PreviewProvider {
//    static var previews: some View {
//        Camera()
//    }
//}

