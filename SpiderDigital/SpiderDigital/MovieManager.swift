//
//  MovieManager.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 19/10/20.
//

import Foundation

class MovieManager {
    private var listOfMovies = [Movie]()
    
    func getMovies() -> [Movie]{
        return listOfMovies
    }
    func addMovie(_ newMovie: Movie) {
        listOfMovies.append(newMovie)
    }
    
    func copyList(list: MovieManager) {
        //listOfMovies.append(contentsOf: list)
    }
}
