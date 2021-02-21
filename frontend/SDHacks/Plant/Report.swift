//
//  Report.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Report: View {
    @Binding var report : Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    report = false
                }) {
                    Image(systemName: "multiply")
                        .font(.system(size: 22))
                        .foregroundColor(Color(hex: "c1c1c1"))
                }.padding(.top, 25)
            }
            Text("Report a problem")
                .foregroundColor(Color(hex: "3a3a3a"))
                .font(.custom("Poppins-Medium", size: 20))
                .padding(.top, 30)
            Image("reportBig")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("If you think you have found a plant pest or any other potential threats and damages, send a report to the admin.  We appreciate it!")
                .font(.custom("Poppins-Regular", size: 12))
                .foregroundColor(Color(hex: "3a3a3a"))
                .multilineTextAlignment(.center)
            Button(action: {
                report = false
            }) {
                Text("Report")
                    .font(.custom("Poppins-Medium", size: 13))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 12)
                    .frame(width: 190)
            }
            .background(Color(hex: "#3A3A3A"))
            .cornerRadius(5)
            .padding(.top, 30)
        }.padding(.horizontal, 35)
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding(.bottom, 25)
        .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(8))
    }
}
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

