//
//  WeatherViewModel.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation


/// A wrapper struct that will contain all the logic for presenting our Weather data.
/// It accepts a `Weather` struct, and contains methods for representing the data contained in that struct
struct CityWeatherVM {
    
    /// The weather data being processed by this view model
    let model: Weather
    
    
    // MARK: Here's where you should add logic for different representations of the temperature in Fahrenheit, Celsius, etc. You'll also want to make the methods for representing the other data (e.g., the weather icon)
    
    /// A getter that returns the formatted temperature, or "No temp" if no data is available. It's currently in Kelvin.
    var formattedCurrentTemp: String {
        guard let temp = model.main?.temp else { return "No temp" }
        return "\(temp)K"
    }
    
    var cityName: String {
        return model.name ?? "No name"
    }
}
