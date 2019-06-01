//
//  ViewController.swift
//  find_movie
//
//  Created by student on 08.05.2019.
//  Copyright © 2019 PG. All rights reserved.
//

import UIKit

// https://www.youtube.com/watch?v=4RyhnwIRjpA
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var currentMoviesList = [Movie]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpFakeMovies()
        useApi(keyword: "batman")
        setUpSearchBar()
    }
    
    private func setUpFakeMovies() {
        currentMoviesList.append(Movie(
            title: "Batman",
            year: "1999",
            imdbID: "xxx",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"))
    
        currentMoviesList.append(Movie(
            title: "X-man",
            year: "1111",
            imdbID: "xxx",
            type: "movie",
            poster: "https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"))
    }
    
    private func useApi(keyword: String) {
        let url = URL(string: "https://www.omdbapi.com/?s=" + keyword.lowercased() + "&apikey=23568a56")
        
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if error != nil {
                print(error!)
            } else {
                
                let jsonObject = try? JSONSerialization.jsonObject(with: data! as Data, options: [])
                if let jsonArray = jsonObject as? [String: Any] {
                    if let results = jsonArray["Search"] as! [Any]?{
                        for result in results {
                            if let resDictionary = result as? [String : Any] {
                                //let title = "asdasa"//resDictionary["Title"] as! String
                                //let year = resDictionary["Year"] as! String
                                //print(title)
                                //print(year)
                                self.currentMoviesList.append(Movie(
                                    title: resDictionary["Title"] as! String,
                                    year: resDictionary["Year"] as! String,
                                    imdbID:  resDictionary["imdbID"] as! String,
                                    type:  resDictionary["Type"] as! String,
                                    poster:  resDictionary["Poster"] as! String))
                                
                            }
                            self.tableView.reloadData()
                            //"Title":"Batman Begins",
                            //"Year":"2005",
                            //"imdbID":"tt0372784",
                            //"Type":"movie",
                            //"Poster":"https://m.media-
                            //https://stackoverflow.com/questions/49282461/creating-objects-from-json-data-using-google-places-api-in-swift
                            
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    private func setUpSearchBar() {
        searchBarView.delegate = self
    }
    
    // Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMoviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell
            else { return UITableViewCell() }
        
        cell.titleLabel.text = currentMoviesList[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIdx = indexPath.row
        //print(selectedIdx)
        
        let selectedMovie = currentMoviesList[selectedIdx]
        //print(selectedMovie.imdbID)
        //let url = URL(string: "https://www.omdbapi.com/?i=" + selectedMovie.imdbID + "&apikey=23568a56")
        
        //let selectedMovieController = ViewController2()
        //self.navigationController?.pushViewController(selectedMovieController, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "movieController") as! ViewController2
        newViewController.movieTitle = selectedMovie.title
        newViewController.movieYear = selectedMovie.year
        newViewController.moviePoster = selectedMovie.poster
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // Search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentMoviesList.removeAll()
        useApi(keyword: searchBar.text!)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
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
    
    init(title: String) {
        self.title = title;
        self.year = "";
        self.imdbID = ""
        self.type = "";
        self.poster = "";
    }
}

