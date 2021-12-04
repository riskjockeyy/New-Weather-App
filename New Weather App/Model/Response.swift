//
//  Response.swift
//  New Weather App
//
//  Created by Bharat Singh on 04/12/21.
//

import Foundation

struct Response: Decodable, Identifiable {
    var id: Int
    var coord: Coord
    var weather: [Weather]
    var main: Main
}

struct Coord: Decodable {
    var lon: Double
    var lat: Double
}

struct Weather: Decodable, Identifiable {
    
    var id: Int
    var description: String
}

struct Main: Decodable {
    
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    
}
