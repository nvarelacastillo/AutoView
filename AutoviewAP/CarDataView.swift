//
//  CarDataView.swift
//  AutoView

import SwiftUI

struct CarDataView: View
{
    @StateObject private var carFetcher = CarDataFetcher()
    @State private var urlString: String
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                if let car = carFetcher.carData
                {
                    List
                    {
                        Text("Trim: \(car.trim)")
                        Text("Make: \(car.make)")
                        Text("Model: \(car.model)")
                        Text("Year: \(car.year)")
                        Text("Mean Price: \(car.price_stats.mean, specifier: "%.2f")")
                        Text("Mean Miles: \(car.miles_stats.mean, specifier: "%.2f")")
                    }
                } else if let error = carFetcher.errorMessage
                {
                    Text(error)
                        .foregroundColor(.red)
                } else
                {
                    ProgressView("Loading car data...")
                }
            }
            .navigationTitle("Car Data")
            .task
            {
                await carFetcher.fetchCarData(from: urlString)
            }
        }
    }
    
    init(urlString: String)
    {
        self._urlString = State(initialValue: urlString)
    }
}
