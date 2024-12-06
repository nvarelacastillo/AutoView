import SwiftUI

struct Car: Identifiable {
    let id = UUID()
    let modelName: String
    let year: String
}

struct ContentView: View {
    let cars: [Car] = [
        Car(modelName: "Car 1", year: "2022"),
        Car(modelName: "Car 2", year: "2023"),
        Car(modelName: "Car 3", year: "2024"),
        Car(modelName: "Car 4", year: "2025")
    ]
    
    @State private var filteredCars: [Car] = []
    @State private var isFiltering: Bool = false
    @State private var showFilterSheet: Bool = false
    @State private var selectedYear: String = ""
    
    var body: some View {
        VStack {
            // Title
            Text("AutoView")
                .font(.custom("Futura", size: 30))
                .bold()
                .padding()
                .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))

            ScrollView {
                ForEach(isFiltering ? filteredCars : cars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        HStack {
                            // Car Icon
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                                .overlay(
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.white)
                                )

                            // Car Details
                            VStack(alignment: .leading) {
                                Text(car.modelName)
                                    .font(.headline)
                                Text(car.year)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.81, green: 0.68, blue: 0.91))
                        )
                        .padding(.horizontal)
                    }
                }
            }

            //Filter Button
            Button(action: {
                showFilterSheet = true //Show the sheet for filtering
            }) {
                Text("Filter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.81, green: 0.68, blue: 0.91))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .sheet(isPresented: $showFilterSheet) {
                // Filter Sheet
                FilterView(
                    selectedYear: $selectedYear,
                    onApply: {
                        applyFilter()
                        showFilterSheet = false // Dismiss the sheet
                    },
                    onCancel: {
                        cancelFilter()
                        showFilterSheet = false // Dismiss the sheet
                    }
                )
            }
        }
    }
    
    func applyFilter() {
        if selectedYear.isEmpty {
            // Show all cars if no year is selected
            isFiltering = false
        } else {
            // Filter cars by the selected year
            filteredCars = cars.filter { $0.year == selectedYear }
            isFiltering = true
        }
    }
    
    func cancelFilter() {
        // Reset the filter and show all cars
        isFiltering = false
        selectedYear = ""
    }
}

struct FilterView: View {
    @Binding var selectedYear: String
    var onApply: () -> Void
    var onCancel: () -> Void

    let years = ["2022", "2023", "2024", "2025"] // Example years

    var body: some View {
        NavigationView {
            VStack {
                Text("Filter by Year")
                    .font(.title)
                    .bold()
                    .padding()

                Picker("Select Year", selection: $selectedYear) {
                    ForEach(years, id: \.self) { year in
                        Text(year).tag(year)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()

                // Apply Button
                Button(action: {
                    onApply() // Apply filter
                }) {
                    Text("Apply Filter")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding()

                // Cancel Button
                Button(action: {
                    onCancel() // Cancel filter
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Filter Options")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
