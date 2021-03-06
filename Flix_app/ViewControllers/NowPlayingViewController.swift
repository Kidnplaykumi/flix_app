//
//  NowPlayingViewController.swift
//  Flix_app
//
//  Created by Elijah Kumi on 1/31/18.
//  Copyright © 2018 Elijah Kumi. All rights reserved.
//

import UIKit
import AlamofireImage
class NowPlayingViewControler: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewControler.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        fetchMovies()
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl)  {
         fetchMovies()
        
    }
    
    func fetchMovies(){
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//
//            } else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let movies = dataDictionary["results"] as! [[String: Any]]
//                self.movies = movies
//                self.activityIndicator.stopAnimating()
//                self.tableView.reloadData()
//                self.refreshControl.endRefreshing()
//            }
//        }
//
//    task.resume()
        
        
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        self.tableView.reloadData()
        self.activityIndicator.stopAnimating()
        self.refreshControl.endRefreshing()
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.movie = movies[indexPath.row]
        
        
        self.tableView.rowHeight = 200
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell =  sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie =  movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            //detailViewController.movie = movie
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        self.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
