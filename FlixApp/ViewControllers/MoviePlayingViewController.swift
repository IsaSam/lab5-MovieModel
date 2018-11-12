//
//  MoviePlayingViewController.swift
//  FlixApp
//
//  Created by Isaac Samuel on 9/17/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import UIKit
import AlamofireImage


class MoviePlayingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredMovies: [[String: Any]]?
    //var movies: [[String: Any]] = []
    var movies: [Movie] = []
    var reasultsController = UITableViewController()
    var refreshControl: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(MoviePlayingViewController.didPullToRefresh(_:)), for: .valueChanged)

        tableView.delegate = self
        tableView.rowHeight = 168
        tableView.estimatedRowHeight = 200
        
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        fetchMovies()
        
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    
    func fetchMovies(){
        //MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
        //MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
        MovieApiManager().popularMovies{(movies: [Movie]?, error: Error?) in
            
            self.activityIndicator.startAnimating()
            if let movies = movies {
                self.movies = movies
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchBar.text!.isEmpty{
            return self.movies.count
        }else{
            return filteredMovies?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movies = movies[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies[(indexPath?.row)!]
        let detailViewController = segue.destination as! DetailViewController
        //detailViewController.movie = movie
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
