//
//  CarDataFetcher.swift
//  AutoView

import Foundation

class CarDataFetcher: ObservableObject
{
    @Published var carData: CarResponse?
    @Published var errorMessage: String?
    
    func fetchCarData(from urlString: String) async
    {
        guard let url = URL(string: urlString) else
        {
            print("Invalid URL: \(urlString)")
            return
        }
        
        do
        {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            {
                if let decodedResponse = try? JSONDecoder().decode(CarResponse.self, from: data)
                {
                    DispatchQueue.main.async
                    {
                        self.carData = decodedResponse
                    }
                } else
                {
                    DispatchQueue.main.async
                    {
                        self.errorMessage = "Failed to decode car data from URL: \(urlString)"
                    }
                }
            } else
            {
                DispatchQueue.main.async
                {
                    self.errorMessage = "Failed to fetch data. Status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)"
                }
            }
        } catch
        {
            DispatchQueue.main.async
            {
                self.errorMessage = "Error fetching data from URL: \(urlString) - \(error.localizedDescription)"
            }
        }
    }
}
