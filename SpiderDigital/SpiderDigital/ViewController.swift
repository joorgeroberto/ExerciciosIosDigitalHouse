//
//  ViewController.swift
//  SpiderDigital
//
//  Created by Jorge Roberto on 18/10/20.
//

import UIKit

class ViewController: UIViewController {
    var listOfMovies = [Movie]()
    var listOfMoviesFiltered = [Movie]()
    var filterQuery = ""
    @IBAction func addMovieAction(_ sender: Any) {
        if let addMovieView = UIStoryboard(name: "AddMovie", bundle: nil).instantiateInitialViewController() as? AddMovieViewController {
            navigationController?.pushViewController(addMovieView, animated: true)
        }
    }
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        searchBar.delegate = self

        
        listOfMovies.append(Movie(name: "Homem-Aranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        listOfMovies.append(Movie(name: "Miranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        listOfMovies.append(Movie(name: "Miranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        listOfMovies.append(Movie(name: "Miranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        listOfMovies.append(Movie(name: "Miranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        listOfMovies.append(Movie(name: "Miranha", gender: "Ação", imageName: "miranha.png", stars: 4))
        
        listOfMoviesFiltered.append(contentsOf: listOfMovies)
    }

    
    private func loadData() {
        listOfMoviesFiltered = [Movie]()
        if !filterQuery.isEmpty {
            listOfMoviesFiltered = listOfMovies.filter { (movie) -> Bool in
                movie.getTerm().contains(filterQuery.lowercased())
            }
        } else {
            listOfMoviesFiltered.append(contentsOf: listOfMovies)
        }
        moviesTableView.reloadData()
    }
}



extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterQuery = searchText
        loadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let movieDetailView = UIStoryboard(name: "MovieDetail", bundle: nil).instantiateInitialViewController() as? MovieDetailViewController {
            movieDetailView.movie = listOfMoviesFiltered[indexPath.row]
            navigationController?.pushViewController(movieDetailView, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMoviesFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MovieTableViewCell
        cell.setup(movie: listOfMoviesFiltered[indexPath.row])
        return cell
    }
    
    
}
