//
//  StartPageView.swift
//  AutoViewApp

import SwiftUI

struct StartPageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("AutoViewBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("START YOUR ENGINES")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 220, height: 50)
                            .background(Color(UIColor(hex: "#FDFFB6")))
                            .cornerRadius(0)
                    }

                    .padding(.bottom, 230)
                }
            }
        }
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}



#Preview {
    StartPageView()
}
