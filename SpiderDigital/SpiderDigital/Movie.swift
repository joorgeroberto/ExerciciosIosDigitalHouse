//
//  Movie.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 18/10/20.
//

import Foundation

protocol SearchableProtocol {
    func getTerm() -> String
}
class Movie {
    var imageName: String
    var name: String
    var gender: String
    var stars: Int
    
    init(name: String, gender: String, imageName: String, stars: Int) {
        self.imageName = imageName
        self.name = name
        self.gender = gender
        self.stars = stars
    }
}

extension Movie: SearchableProtocol {
    func getTerm() -> String {
        return "\(name) \(gender)".lowercased()
    }
}
