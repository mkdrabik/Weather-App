//
//  WeatherService.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation

/// A namespace for the function that fetches the data from the API
enum WeatherService {
    static func getWeather(cityString: String) async -> Weather? {
        let apiKey = "755f77160a12ded1eddd9adc20b9c3f4"
        
        let replaced = (cityString as NSString).replacingOccurrences(of: " ", with: "+")
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(replaced)&appid=\(apiKey)") else {
            print("Error")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(Weather.self, from: data) {
                return decodedData
            } else {
                print("Decoding error")
                return nil
            }
        } catch {
            print("Error Loading Data")
            return nil
        }
    }
}

