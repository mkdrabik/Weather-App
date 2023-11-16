//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @State var city: String = ""
    @State var isPresented = false
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Weathery")
                    .font(.system(size: 35, weight: .medium, design: .default))
                    .padding(.trailing, 50)
                Button{
                   isPresented = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.vertical, 30)
            Spacer()
            VStack {
                ScrollView(.horizontal){
                    HStack{
                        ForEach(viewModel.weatherData) { weather in
                            CityWeatherView(viewModel: CityWeatherVM(model: weather, unit: "celcius"))
                        }
                    }
                }
                .padding(.vertical, 40)
                /*Button("Get data") {
                    viewModel.getWeather(cityString: city)
                }
                 */
            }
            .sheet(isPresented: $isPresented) {
                AddView(viewModel: viewModel, city: $city, viewing: $isPresented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
