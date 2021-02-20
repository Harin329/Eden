//
//  Dashboard.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-20.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    DashboardHead()
                        .zIndex(1.0)
                    VStack {
                        Button(action: {}){
                            NearbyCard()
                        }.foregroundColor(.black)
                        HStack {
                            Button(action:{}) {
                                Text("Plots")
                                    .font(.system(size: 26))
                                    .foregroundColor(.black)
                            }.padding(.trailing, 20)
                            Button(action:{}) {
                                Text("Saved")
                                    .font(.system(size: 26))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action:{}) {
                                Text("See all")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.top, 25)
                        .padding(.horizontal, 25)
                        PlantScroll()
                            .offset(y: -10)
                        RecentContributors()
                            .padding(.bottom, 80)
                    }.offset(y: 85)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .background(
                    Image("dashboardBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -85))
            }
        }.accentColor( Color(hex: "#000"))
    }
    
//    func getArticles() {
//            guard let url = URL(string: "http://www.muse-magazine.com/wp-json/wp/v2/posts") else { return }
//            
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let data = data {
//                    if let response = try? JSONSerialization.jsonObject(with: data, options: []) {
//                        DispatchQueue.main.async {
//                            var index = 0
//                            for i in response as! Array<Dictionary<String, Any>>{
//                                // Get rid of HTML
//                                var cleaned_body = ((i["content"] as! Dictionary<String, Any>)["rendered"] as! String).replacingOccurrences(of: "\\s?\\<[^>]*\\>", with: "", options: .regularExpression)
//                                
//                                // Get rid of stuff at the end
//                                if let index = cleaned_body.range(of: "&nbsp")?.lowerBound {
//                                    cleaned_body = String(cleaned_body[..<index])
//                                }
//                                // Get rid of stuff at the end
//                                if let index = cleaned_body.range(of: "HEADER IMAGE")?.lowerBound {
//                                    cleaned_body = String(cleaned_body[..<index])
//                                }
//
//                                self.stories.append(
//                                    Story(
//                                        id: index,
//                                        image: i["jetpack_featured_media_url"] as! String,
//                                        offset: 0,
//                                        title: (i["title"] as! Dictionary<String, String>)["rendered"]!,
//                                        author: String(i["author"] as! Int),
//                                        body: cleaned_body
//                                    )
//                                )
//                                index += 1
//                            }
//                        }
//                        self.loadedData = true
//                        return
//                    }
//                }
//            }
//            .resume()
//        }
}




struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
