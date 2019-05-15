//
//  ViewController.swift
//  find_movie
//
//  Created by student on 08.05.2019.
//  Copyright © 2019 PG. All rights reserved.
//

import UIKit

// https://www.youtube.com/watch?v=4RyhnwIRjpA  8:55
class ViewController: UIViewController {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var moviesList = [Movie]()
    
    //let moviesList = ["Pierwszy", "Drugi", "Trzeci"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMovies()
    }
    
    private func setUpMovies() {
        moviesList.append(Movie(
            title: "Batman",
            year: "1999",
            imdbID: "xxx",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"))
    
        moviesList.append(Movie(
            title: "X-man",
            year: "1111",
            imdbID: "xxx",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"))
        
        moviesList.append(Movie(
            title: "nextt",
            year: "2010",
            imdbID: "xxx",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"))
    }
}

// e.g. http://www.omdbapi.com/?s=batman&apikey=23568a56
class Movie	{
    let title: String;
    let year: String;
    let imdbID: String;
    let type: String;
    let poster: String;
    
    init(title: String, year: String, imdbID: String, type: String, poster: String) {
        self.title = title;
        self.year = year;
        self.imdbID = imdbID;
        self.type = type;
        self.poster = poster;
    }
}

