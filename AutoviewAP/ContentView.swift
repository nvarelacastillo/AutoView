//
//  ContentView.swift
//  AutoView

import SwiftUI

struct ContentView: View
{
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
    
    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                VStack
                {
                    // Honda Civic Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showCivicLinks.toggle() 
                        }
                    }) // end button creation
                    {
                        Text("Honda Civic")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showCivicLinks
                    {
                        ForEach(HondaCivicLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Honda Civic \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                    
                    // Toyota Camry Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showCamryLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Toyota Camry")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showCamryLinks
                    {
                        ForEach(ToyotaCamryLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Toyota Camry \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                } // end first VStack
                
                VStack
                {
                    // Mazda CX5 Series Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showCX5Links.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Mazda CX-5")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showCX5Links
                    {
                        ForEach(MazdaCX5Links, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Mazda CX5 \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                    
                    // BMW 3 Series Button
                    Button(action:
                            {
                        withAnimation
                        {
                            show3SeriesLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("BMW 3 Series")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if show3SeriesLinks
                    {
                        ForEach(Bmw3SeriesLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("BMW 3 Series \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                } // end second VStack
                
                VStack
                {
                    // BMW X3 Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showX3Links.toggle()
                        }
                    }) // end button creation
                    {
                        Text("BMW X3")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showX3Links
                    {
                        ForEach(BmwX3Links, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("BMW X3 \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                    
                    // Lexus IS Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showISLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Lexus IS")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showISLinks
                    {
                        ForEach(LexusISLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Lexus IS \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                } // end third VStack
                
                VStack
                {
                    // Lexus RX Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showRXLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Lexus RX")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showRXLinks
                    {
                        ForEach(LexusRXLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Lexus RX \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                    
                    // Land Rover Defender Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showDefenderLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Land Rover Defender")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showDefenderLinks
                    {
                        ForEach(LandRoverDefenderLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Land Rover Defender \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                } // end fourth VStack
                
                VStack
                {
                    // Porsche 911 Button
                    Button(action:
                            {
                        withAnimation
                        {
                            show911Links.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Porsche 911")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if show911Links
                    {
                        ForEach(Porsche911Links, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Porsche 911 \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                    Divider()
                    
                    // Nissan GTR Button
                    Button(action:
                            {
                        withAnimation
                        {
                            showGTRLinks.toggle()
                        }
                    }) // end button creation
                    {
                        Text("Nissan GTR")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.50, blue: 0.75))
                            .cornerRadius(10)
                    } // end button design
                    if showGTRLinks
                    {
                        ForEach(NissanGTRLinks, id: \.self)
                        { link in
                            NavigationLink(destination: CarDataView(urlString: link))
                            {
                                Text("Nissan GTR \(getYear(from: link))")
                                    .font(.title3)
                                    .padding(.bottom, 10)
                            }
                        }
                    } // end data
                } // end fifth VStack
            } // end ScrollView
        } // end NavigationView
    } // end body
        
        // helper function extracting year from URL (formatted as Year Model)
    func getYear(from url: String) -> String
    {
        let components = url.split(separator: "&")
        for component in components
        {
            if component.contains("ymmt=")
            {
                let yearComponent = component.split(separator: "%7C")[0]
                if let yearString = yearComponent.split(separator: "=").last
                {
                    let cleanedYear = yearString.filter { $0.isNumber }
                    if let year = Int(cleanedYear)
                    {
                        return String(year)
                    }
                }
            }
        }
        return "Unknown Year"
    } // end func
} // end struct


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
