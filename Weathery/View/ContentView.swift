//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.weatherData) { weather in
                CityWeatherView(viewModel: CityWeatherVM(model: weather))
            }
            Button("Get Chapel Hill data") {
                viewModel.getWeather(cityString: "Chapel Hill")
            }
        }
        // MARK: This onAppear modifier is just fetching the data for Charlotte when this view appears. You can get rid of it.
        .onAppear {
            viewModel.getWeather(cityString: "Charlotte")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
