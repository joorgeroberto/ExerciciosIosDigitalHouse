//
//  City.swift
//  1014_DesafioPickerView
//
//  Created by Jorge Roberto on 15/10/20.
//

import Foundation

class City {
    var name: String
    var state: String
    var country: String
    var numberOfInhabitants: Double
    var temperatureInCelsiusDegrees: Int

    init(name: String, state: String, country: String, numberOfInhabitants: Double, temperatureInCelsiusDegrees: Int) {
        self.name = name
        self.state = state
        self.country = country
        self.numberOfInhabitants = numberOfInhabitants
        self.temperatureInCelsiusDegrees = temperatureInCelsiusDegrees
    }
}
