//
//  CarView.swift
//  AutoView
//
//  Created by Nicole Varela on 12/6/24.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "car.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))

            Text(car.modelName)
                .font(.largeTitle)
                .bold()

            Text("Year: \(car.year)")
                .font(.title2)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle(car.modelName)    }
}


#Preview {
    CarDetailView(car: Car(modelName: "Car 1", year: "2022"))
}
