//
//  ViewController2.swift
//  find_movie
//
//  Created by Tomasz Długokiński on 01/06/2019.
//  Copyright © 2019 PG. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var yearView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movieTitle : String = "Batman"
    var movieYear : String = "2005"
    var moviePoster: String = "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleView.text = self.movieTitle
        self.yearView.text = self.movieYear
        
        let url = URL(string: self.moviePoster)
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {    // execute on main thread
                self.imageView.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }

    
}
