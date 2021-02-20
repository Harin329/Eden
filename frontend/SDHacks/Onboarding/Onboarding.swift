//
//  Onboarding.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI

struct Onboarding: View {
    let titles = ["Snap", "Pack", "Map", "Track"]
    let bodies = ["Take a photo of food you \ncannot finish", "Seal, pack, and schedule pickup \nof your surplus food","Locate donation hotspots and \nfood items in demand", "Rely on our driver to deliver your \nfood safely to non-profit recipient"]
    @State var slide = 0
    @Binding var login: Bool

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if slide == 0 {
                    Rectangle().fill(Color.clear).frame(height: 60)
                    Text("Welcome to")
                        .foregroundColor(Color(hex: "#255359"))
                        .font(.body)
                        .padding(.bottom, 5)
                        .padding(.top,22)
                        .offset(y:90)
                }
                else {
                Text(titles[slide-1])
                    .foregroundColor(Color(hex: "#255359"))
                    .font(.title)
                    .padding(.bottom, 20)
                Text(bodies[slide-1])
                    .foregroundColor(Color(hex: "#255359"))
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                }
                ImageSlider(slide: $slide).offset(y:-50)
                NavigationLink(destination: Signup(login: $login)) {
                    HStack {
                        Text("Sign up")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],20)
                            .frame(width:220)
                    }.background(Color(hex: "#255359"))
                }.cornerRadius(30).padding(.top, 20)
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.accentColor( Color(hex: "#255359"))
    }
}

struct ImageSlider: View {
    @Binding var slide : Int
    var body: some View {
        ZStack {
            PagerView(pageCount: 5, currentIndex: $slide) {
            Image("fridgeSpace")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 350)
            Image("onboarding0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 350)
            Image("onboarding1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 350)
            Image("onboarding2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 350)
            Image("onboarding3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 350)
            }.frame(height: 350)
            VStack {
                Spacer()
                HeaderBar(capsuleColor: Color(hex: "#E8E8E8"), highlightColor: Color(hex: "#3E6E79"),slide: $slide, total: 5)
            }.frame(width: 350, height: 350)
        }
    }
}

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    @GestureState private var translation: CGFloat = 0

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}

struct HeaderBar: View {
    var capsuleColor: Color
    var highlightColor: Color
    @Binding var slide: Int
    var total : Int
    var body: some View {
        HStack(spacing: 4) {
            Capsule()
                .foregroundColor((slide == 0) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 0) ? 0.5 :0)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor((slide == 1) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 1) ? 0.5 :0)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor((slide == 2) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 2) ? 0.5 :0)
                .frame(width: 40, height: 5)
            if total > 3 {
                Capsule()
                    .foregroundColor((slide == 3) ? highlightColor : capsuleColor)
                    .shadow(color: .white, radius: (slide == 3) ? 0.5 :0)
                    .frame(width: 40, height: 5)
            }
            if total > 4 {
                Capsule()
                    .foregroundColor((slide == 4) ? highlightColor : capsuleColor)
                    .shadow(color: .white, radius: (slide == 4) ? 0.5 :0)
                    .frame(width: 40, height: 5)
            }
        }.padding(.bottom, 20)
    }
}
