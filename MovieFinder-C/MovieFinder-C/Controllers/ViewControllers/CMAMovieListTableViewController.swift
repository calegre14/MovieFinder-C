//
//  CMAMovieListTableViewController.swift
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CMAMovieListTableViewController: UITableViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    //MARK:- Properties
    var movies: [CMAMovieCollection] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = 200
        movieSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? CMAMovieTableViewCell else {return UITableViewCell()}
        cell.movie = movies[indexPath.row]
        return cell
    }
}

extension CMAMovieListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        CMAMovieCollectionController.fetchMovie(withSearchTerm: searchText) { (movies) in
            guard let movies = movies else {return}
            self.movies = movies
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
