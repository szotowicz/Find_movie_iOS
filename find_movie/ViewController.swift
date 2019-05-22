//
//  ViewController.swift
//  find_movie
//
//  Created by student on 08.05.2019.
//  Copyright © 2019 PG. All rights reserved.
//

import UIKit

// https://www.youtube.com/watch?v=4RyhnwIRjpA  8:55
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var moviesList = [Movie]()
    var moviesList2 = [Movie]()
    
    //let moviesList = ["Pierwszy", "Drugi", "Trzeci"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMovies()
        useApi()
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
    
    private func useApi() {
        let url = URL(string: "https://www.omdbapi.com/?s=batman&apikey=23568a56")
        //let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1")
        
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
                                let title = resDictionary["Title"] as! String
                                let year = resDictionary["Year"] as! String
                                print(title)
                            }
                            //"Title":"Batman Begins",
                            //"Year":"2005",
                            //"imdbID":"tt0372784",
                            //"Type":"movie",
                            //"Poster":"https://m.media-
                            
                            //https://stackoverflow.com/questions/49282461/creating-objects-from-json-data-using-google-places-api-in-swift
                            
                            //let title = result["Title"] as! [String]
                            //print("----")
                            //print(result)
                        }
                    }
                }
                
                
                if let urlContent = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options:
                            JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //print(jsonResult)
                        //print(jsonResult["Search"])
                        let json = jsonResult["Search"]
                        
                    } catch {
                        print("Json Processing Failed!")
                    }
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell
            else { return UITableViewCell() }
        
        cell.titleLabel.text = moviesList[indexPath.row].title
        
        return cell
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

