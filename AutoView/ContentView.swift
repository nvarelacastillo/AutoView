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
            Text("AutoView")
                .font(.custom("Futura", size: 30))
                .bold()
                .padding()
                .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))

            ScrollView {
                ForEach(isFiltering ? filteredCars : cars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        HStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                                .overlay(
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.white)
                                )

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

       
            Button(action: {
                showFilterSheet = true
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
               
                FilterView(
                    selectedYear: $selectedYear,
                    onApply: {
                        applyFilter()
                        showFilterSheet = false
                    },
                    onCancel: {
                        cancelFilter()
                        showFilterSheet = false
                    }
                )
            }
        }
    }
    
    func applyFilter() {
        if selectedYear.isEmpty {
         
            isFiltering = false
        } else {
 
            filteredCars = cars.filter { $0.year == selectedYear }
            isFiltering = true
        }
    }
    
    func cancelFilter() {
 
        isFiltering = false
        selectedYear = ""
    }
}

struct FilterView: View {
    @Binding var selectedYear: String
    var onApply: () -> Void
    var onCancel: () -> Void

    let years = ["2022", "2023", "2024", "2025"]

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

     
                Button(action: {
                    onApply()
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

         
                Button(action: {
                    onCancel()
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
