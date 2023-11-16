//
//  CityWeatherView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    /// The View Model doing all the work for our view.
    let viewModel: CityWeatherVM
    
    var body: some View {
        VStack {
            Text(viewModel.cityName)
            Text(viewModel.formattedCurrentTemp)
        }
        .frame(width: 300, height: 600)
        .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: CityWeatherVM(model: Weather.example, unit: "fahrenheit"))
    }
}
