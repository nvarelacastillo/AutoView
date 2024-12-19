import SwiftUI

struct CarDataView: View {
    @StateObject private var carFetcher = CarDataFetcher()
    @State private var urlString: String

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("AutoViewAppBasic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Car Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                    .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                    .frame(maxWidth: .infinity)
                
                if let car = carFetcher.carData {
                    List {
                        Text("Trim: \(car.trim)")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))

                        Text("Make: \(car.make)")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))

                        Text("Model: \(car.model)")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))

                        Text("Year: \(car.year)")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))

                        Text("Mean Price: \(car.price_stats.mean, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))

                        Text("Mean Miles: \(car.miles_stats.mean, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                } else if let error = carFetcher.errorMessage {
                    Text(error)
                        .foregroundColor(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                } else {
                    ProgressView("Loading car data...")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .navigationBarHidden(true)
            .task {
                await carFetcher.fetchCarData(from: urlString)
            }
        }
    }

    init(urlString: String) {
        self._urlString = State(initialValue: urlString)
    }
}
