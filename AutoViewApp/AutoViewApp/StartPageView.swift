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
                            .background(Color(red: 253 / 255, green: 255 / 255, blue: 182 / 255))
                            .cornerRadius(0)
                    }
                    .padding(.bottom, 230)
                }
            }
        }
    }
}

#Preview {
    StartPageView()
}
