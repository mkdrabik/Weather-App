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
    let unit: String
    
    
    // MARK: Here's where you should add logic for different representations of the temperature in Fahrenheit, Celsius, etc. You'll also want to make the methods for representing the other data (e.g., the weather icon)
    
    /// A getter that returns the formatted temperature, or "No temp" if no data is available. It's currently in Kelvin.
    var formattedCurrentTemp: String {
        guard let temp = model.main?.temp else { return "No temp" }
        let temperature = Measurement(value: temp, unit: UnitTemperature.kelvin)
        if(unit == "fahrenheit"){
            let f = Int(temperature.converted(to: .fahrenheit).value)
            return "\(f) °F"
        }
        if(unit == "fahrenheit"){
            let f = Int(temperature.converted(to: .fahrenheit).value)
            return "\(f) °F"
        }
        if(unit == "celcius"){
            let c = Int(temperature.converted(to: .celsius).value)
            return "\(c) °C"
        }
        if(unit == "kelvin"){
            let k = Int(temperature.converted(to: .kelvin).value)
            return "\(k) °K"
        }
        return "\(temp) °K"
    }
    
    var formattedHL: String {
        guard let h = model.main?.tempMax else { return "No temp"}
        guard let l = model.main?.tempMin else { return "No temp"}
        let high = Measurement(value: h, unit: UnitTemperature.kelvin)
        let low = Measurement(value: l, unit: UnitTemperature.kelvin)
        
        if(unit == "fahrenheit"){
            let hi = Int(high.converted(to: .fahrenheit).value)
            let lo = Int(low.converted(to: .fahrenheit).value)
            return "High: \(hi)  Low: \(lo)"
        }
        if(unit == "celcius"){
            let hi = Int(high.converted(to: .celsius).value)
            let lo = Int(low.converted(to: .celsius).value)
            return "High: \(hi)  Low: \(lo)"
        }
        
        let hi = Int(high.converted(to: .kelvin).value)
        let lo = Int(low.converted(to: .kelvin).value)
        return "High: \(hi)  Low: \(lo)"
    }
    
    var cityName: String {
        return model.name ?? "No name"
    }
}
