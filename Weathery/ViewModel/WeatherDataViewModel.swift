//
//  WeatherViewModel.swift
//  Weathery
//
//  
//

import Foundation

@MainActor class WeatherDataViewModel: ObservableObject {
    /// A list tracking weather data for all searched cities
    @Published var weatherData = [Weather]()
    
    /**
     Gets the weather from the API for a particular city and appends the weather data to a list
     - Parameters:
        - cityString: a raw string representing the city. For example, "Charlotte" or "New York City"
     - Returns:
        - Doesn't return anything; just appends the response to the weatherData list.
     */
    func getWeather(cityString: String) {
        Task {
            guard let response = await WeatherService.getWeather(cityString: cityString) else {
                // Response is nil
                // MARK: Put some logic here that will signal to the user that the request has failed
                return
            }
            weatherData.append(response)
        }
    }
    
}
