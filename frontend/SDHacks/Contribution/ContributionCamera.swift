//
//  ContributionCamera.swift
//  SDHacks
//
//  Created by Harin Wu on 2021-02-20.
//

import UIKit
import SwiftUI

final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.selectedImage = image
        }
        
        parent.presentationMode.wrappedValue.dismiss()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType =  sourceType
        if (sourceType == .camera) {
            imagePicker.showsCameraControls = false
        }
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
}

struct ContributionCamera: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var plantInfo: PlantType
    var contributeType: String
    var contributeDate: Date
    
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
                Text("Splendid!").fontWeight(.medium).padding(.leading, 25).padding(.top, 10).foregroundColor(Color(hex: "#C4C4C4"))
                Spacer()
            }
            HStack {
                Text("Snap a picture of your contribution!").font(.system(size: 24)).padding(.leading, 25).padding(.top, 5).frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                Spacer()
            }
            VStack {
                ImagePicker(selectedImage: self.$image, sourceType: .camera).frame(height: 400)
                NavigationLink(destination: ContributionConfirmation(plantInfo: plantInfo, contributeType: contributeType, contributeDate: contributeDate, contributionImage: image)) {
                Text("Capture")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 12)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }
            .background(Color(hex: "#ffffff"))
            .cornerRadius(100)
            .padding(.top, -80)
        }
        HStack {
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                Text("Camera Roll")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 12)
                    .frame(width: 150)
            }
            .background(Color(hex: "#3A3A3A"))
            .cornerRadius(5)
            .padding(.top, 10)

            NavigationLink(destination: ContributionConfirmation(plantInfo: plantInfo, contributeType: contributeType, contributeDate: contributeDate, contributionImage: image)) {
                
                Text("Next")
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 12)
                    .frame(width: 150)
            }
            .background(Color(hex: "#3A3A3A"))
            .cornerRadius(5)
            .padding(.top, 10)

        }.padding(.horizontal, 10)
        Spacer()
        
    }.sheet(isPresented: $isShowPhotoLibrary, content: {
    ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
    }).navigationBarTitle("")
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
}
}

//struct ContributionCamera_Previews: PreviewProvider {
//    static var previews: some View {
//        ContributionCamera()
//    }
//}
