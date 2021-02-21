//
//  ContributionCamera.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType =  sourceType
        
        return imagePicker
    }
}

struct ContributionCamera: View {
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
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
                Text("How would you like to contribute today?").font(.system(size: 24)).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            VStack {
                ImagePicker(sourceType: .camera)
            }.padding(.top, 30)
            HStack {
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    Text("Choose From Camera Roll")
                        .font(.system(size: 14))
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 12)
                        .frame(width: 300)
                }
                .background(Color(hex: "#3A3A3A"))
                .cornerRadius(5)
                .padding(.top, 30)
            }
            Spacer()
            
        }.sheet(isPresented: $isShowPhotoLibrary, content: {
            ImagePicker(sourceType: .photoLibrary)
        })
    }
}

struct ContributionCamera_Previews: PreviewProvider {
    static var previews: some View {
        ContributionCamera()
    }
}
