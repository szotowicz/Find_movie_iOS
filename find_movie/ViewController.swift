//
//  ViewController.swift
//  find_movie
//
//  Created by student on 08.05.2019.
//  Copyright © 2019 PG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let moviesList = ["Pierwszy", "Drugi", "Trzeci"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

