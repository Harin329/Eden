//
//  DetailedGarden.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct DetailedGarden: View {
    var place: Garden
    @Binding var showDetails: Bool
    @Binding var y : CGFloat
//    @Binding var showCaptureImageView: Bool
//    @Binding var show : Bool
    var length: CGFloat = 150.0
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(hex: "C4C4C4"))
                .frame(width: 40, height: 5)
            HStack {
                Image("detailedView")
                VStack {
                    HStack {
                        Text(place.name)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "255359"))
                        Spacer()
                    }
                    HStack{
                        Text(String(place.rating) + ".0")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "3E6E79"))
                        ForEach(1..<5+1) { number in
                            if number < 5 {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "FFC331"))
                                    .padding(-3)
                            }
                            else {
                                Image(systemName: "star")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "FFC331"))
                                    .padding(-3)
                            }
                        }
                        Text("(97)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "3E6E79"))
                        Spacer()
                    }
                    HStack {
                        Text(place.description)
                            .font(.subheadline)

                            .foregroundColor(Color(hex: "3E6E79"))
                        Spacer()
                    }
                }
            }
            HStack {
                Text("See what’s in demand:")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "255359"))
                Spacer()
            }
            HStack {
                Text("Non-perishable")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "9CC3AC")))
                Text("Fresh Fruit")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "FFC331")))
                Text("Vegetable")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,11)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "5590C3")))
            }
            HStack {
                Text("24")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "9CC3AC"))
                Text("households donated here today!")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "255359"))
                Spacer()
            }
            Button(action: {
//                showCaptureImageView.toggle()
//                show.toggle()
            }) {
                HStack {
                    Text("Donate")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:200)
                }.background(Color(hex: "#255359"))
            }.cornerRadius(30).padding(.top, 5)
        }
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Rectangle()
        .fill(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 8))
        .animation(.interpolatingSpring(stiffness: 30, damping: 30))
        .gesture(DragGesture()
                    .onChanged { gesture in
                        self.y = gesture.translation.height
                    }
                    .onEnded { _ in
                        if y > 100 {
                            showDetails.toggle()
                            self.y = .zero
                        } else {
                            self.y = .zero
                        }
                    })
    }
}
