//  WeatherModel.swift
//  AcademyMP07
//
// 
//

import Foundation

// MARK: - Weather

struct Weather: Codable, Identifiable {
    let coord: Coord?
    let weather: [WeatherElement]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?

}

// MARK: - Clouds

struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord

struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain

struct Rain: Codable {
    let singleHour: Double?

    enum CodingKeys: String, CodingKey {
        case singleHour = "1h"
    }
}

// MARK: - Sys

struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - WeatherElement

struct WeatherElement: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

extension Weather {
    static var example: Weather {
        Weather(coord: Coord(lon: 1, lat: 1), weather: [WeatherElement(id: 1, main: "Weather", weatherDescription: "N/A", icon: "cloud")], base: "base", main: Main(temp: 284, feelsLike: 4, tempMin: 4, tempMax: 4, pressure: 4, humidity: 4, seaLevel: 4, grndLevel: 4), visibility: 4, wind: Wind(speed: 3, deg: 3, gust: 3), rain: Rain(singleHour: 4), clouds: Clouds(all: 3), dt: 4, sys: Sys(type: 4, id: 4, country: "USA", sunrise: 5, sunset: 5), timezone: 5, id: 5, name: "Chapel Hill", cod: 5)
    }
}
