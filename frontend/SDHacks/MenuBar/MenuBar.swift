//
//  MenuBar.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//


import SwiftUI

struct MenuBar : View {
    
    @Binding var index : Int
    @State var curvePos : CGFloat = 0
    
    var body: some View{
        VStack {
            Spacer()
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                Spacer()
                HStack{
                    GeometryReader{g in
                        VStack{
                            Button(action: {
                                withAnimation(.spring()){
                                    index = 0
                                    self.curvePos = g.frame(in: .global).midX
                                }
                            }, label: {
                                Image("MenuHome")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(index == 0 ? .white : Color(hex:"68C883"))
                                    .frame(width: 28, height: 28)
                                    .padding(.all, 15)
                                    // animating View...
                                    .background(Color(hex:"68C883").opacity(index == 0 ? 1 : 0).clipShape(Circle()))
                                    .offset(y: index == 0 ? -35 : 0)
                            })
                        }
                        .frame(width: 43, height: 43)
                        .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }
                    }
                    .frame(width: 43, height: 43)
                    Spacer(minLength: 0)
                    GeometryReader{g in
                        VStack{
                            Button(action: {
                                withAnimation(.spring()){
                                    index = 1
                                    self.curvePos = g.frame(in: .global).midX
                                }
                            }, label: {
                                Image("MenuCamera")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(index == 1 ? .white : Color(hex:"68C883"))
                                    .frame(width: 28, height: 28)
                                    .padding(.all, 15)
                                    .background(Color(hex:"68C883").opacity(index == 1 ? 1 : 0).clipShape(Circle()))
                                    .offset(y: index == 1 ? -35 : 0)
                            })
                        }
                        .frame(width: 43, height: 43)
                    }
                    .frame(width: 43, height: 43)
                    Spacer(minLength: 0)
                    GeometryReader{g in
                        VStack{
                            Button(action: {
                                withAnimation(.spring()){
                                    index = 2
                                    self.curvePos = g.frame(in: .global).midX
                                }
                            }, label: {
                                Image("MenuProfile")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(index == 2 ? .white : Color(hex:"68C883"))
                                    .frame(width: 28, height: 28)
                                    .padding(.all, 15)
                                    .background(Color(hex:"68C883").opacity(index == 2 ? 1 : 0).clipShape(Circle()))
                                    .offset(y: index == 2 ? -35 : 0)
                            })
                        }
                        .frame(width: 43, height: 43)
                    }
                    .frame(width: 43, height: 43)
                }
                .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 8 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.top, 8)
                .background(Color.white.clipShape(CShape(curvePos: curvePos)))
            })
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CShape : Shape {
    var curvePos : CGFloat
    var animatableData: CGFloat{
        
        get{return curvePos}
        set{curvePos = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.move(to: CGPoint(x: curvePos + 40, y: 0))
            path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0), control: CGPoint(x: curvePos, y: 70))
        }
    }
}
