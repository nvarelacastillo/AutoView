import SwiftUI

struct ContentView: View {
    @State private var showCivicLinks = false
    @State private var showCamryLinks = false
    @State private var showCX5Links = false
    @State private var show3SeriesLinks = false
    @State private var showX3Links = false
    @State private var showISLinks = false
    @State private var showRXLinks = false
    @State private var showDefenderLinks = false
    @State private var show911Links = false
    @State private var showGTRLinks = false
    @State private var showFilterPopup = false
    @State private var selectedYears: [String] = []
    let yearRange = Array(2017...2024).map { String($0) }

    var body: some View {
        NavigationView {
            ZStack {
                Image("AutoViewAppBasic")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Text("All Cars")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding()
                        .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                        .cornerRadius(8)

                    ScrollView {
                        VStack(spacing: 20) {
                            Group {
                                createButtonSection(
                                    title: "Honda Civic",
                                    showLinks: $showCivicLinks,
                                    links: HondaCivicLinks
                                )

                                createButtonSection(
                                    title: "Toyota Camry",
                                    showLinks: $showCamryLinks,
                                    links: ToyotaCamryLinks
                                )
                            }

                            Divider()

                            Group {
                                createButtonSection(
                                    title: "Mazda CX-5",
                                    showLinks: $showCX5Links,
                                    links: MazdaCX5Links
                                )

                                createButtonSection(
                                    title: "BMW 3 Series",
                                    showLinks: $show3SeriesLinks,
                                    links: Bmw3SeriesLinks
                                )
                            }

                            Divider()

                            Group {
                                createButtonSection(
                                    title: "BMW X3",
                                    showLinks: $showX3Links,
                                    links: BmwX3Links
                                )

                                createButtonSection(
                                    title: "Lexus IS",
                                    showLinks: $showISLinks,
                                    links: LexusISLinks
                                )
                            }

                            Divider()

                            Group {
                                createButtonSection(
                                    title: "Lexus RX",
                                    showLinks: $showRXLinks,
                                    links: LexusRXLinks
                                )

                                createButtonSection(
                                    title: "Land Rover Defender",
                                    showLinks: $showDefenderLinks,
                                    links: LandRoverDefenderLinks
                                )
                            }

                            Divider()

                            Group {
                                createButtonSection(
                                    title: "Porsche 911",
                                    showLinks: $show911Links,
                                    links: Porsche911Links
                                )

                                createButtonSection(
                                    title: "Nissan GTR",
                                    showLinks: $showGTRLinks,
                                    links: NissanGTRLinks
                                )
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }

                    Spacer()

                    Button(action: {
                        showFilterPopup = true
                    }) {
                        Text("Filter by Year")
                            .font(.title3)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                            .cornerRadius(0)
                    }
                    .padding(.bottom, 40)
                }

                if showFilterPopup {
                    ZStack {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()

                        VStack {
                            Text("Select a Year")
                                .font(.headline)
                                .padding()

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(yearRange, id: \.self) { year in
                                        Button(action: {
                                            toggleYearSelection(year)
                                        }) {
                                            Text(year)
                                                .font(.title3)
                                                .padding()
                                                .foregroundColor(.white)
                                                .background(selectedYears.contains(year) ? Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255) : Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                                .padding()
                            }

                            Button(action: {
                                selectedYears.removeAll()
                                showFilterPopup = false
                            }) {
                                Text("Clear Filter")
                                    .font(.title3)
                                    .padding()
                                    .foregroundColor(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                                    .background(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                                    .cornerRadius(8)
                            }
                            .padding(.top)

                            Button(action: {
                                showFilterPopup = false
                            }) {
                                Text("Close")
                                    .font(.title3)
                                    .padding()
                                    .foregroundColor(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                                    .background(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                                    .cornerRadius(8)
                            }
                            .padding(.top)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                }
            }
        }
    }

    private func toggleYearSelection(_ year: String) {
        if selectedYears.contains(year) {
            selectedYears.removeAll { $0 == year }
        } else {
            selectedYears.append(year)
        }
    }

    func createButtonSection(title: String, showLinks: Binding<Bool>, links: [String]) -> some View {
        VStack {
            Button(action: {
                withAnimation {
                    showLinks.wrappedValue.toggle()
                }
            }) {
                Text(title)
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 0.894, green: 0.992, blue: 0.882))
                    .cornerRadius(0)
            }
            if showLinks.wrappedValue {
                ForEach(links.filter { link in
                    guard !selectedYears.isEmpty else { return true }
                    return selectedYears.contains(getYear(from: link))
                }, id: \.self) { link in
                    NavigationLink(destination: CarDataView(urlString: link)) {
                        Text("\(title) \(getYear(from: link))")
                            .font(.title3)
                            .padding()
                            .foregroundColor(.blue)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }

    func getYear(from url: String) -> String {
        let components = url.split(separator: "&")
        for component in components {
            if component.contains("ymmt=") {
                let yearComponent = component.split(separator: "%7C")[0]
                if let yearString = yearComponent.split(separator: "=").last {
                    let cleanedYear = yearString.filter { $0.isNumber }
                    if let year = Int(cleanedYear) {
                        return String(year)
                    }
                }
            }
        }
        return "Unknown Year"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
