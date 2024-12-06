//
//  CoverView.swift
//  AutoView
//
//  Created by Nicole Varela on 12/1/24.
//

import SwiftUI

struct CoverPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                //App Title
                Text("AutoView")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                    .padding()

                //App Icon (Will chnage later)
                Image(systemName: "car.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                    .padding()

                Spacer()
                
                //Navigation Button
                NavigationLink(destination: ContentView()) {
                    Text("View Cars")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.81, green: 0.68, blue: 0.91))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarHidden(true)// Hide navigation bar on cover page
        }
    }
}

struct CoverPageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverPageView()
    }
}
