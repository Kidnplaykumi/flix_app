 //
//  DetailViewController.swift
//  Flix_app
//
//  Created by Elijah Kumi on 2/8/18.
//  Copyright © 2018 Elijah Kumi. All rights reserved.
//

import UIKit

 enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
 }

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [Movie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie[MovieKeys.title] as? String
            releseDateLabel.text = movie["relese_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString =  movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString +  backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
            
            let dataDictionary = try! JSONSerialization.jsonObject(with: Data, options: []) as! [String: Any]
            let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
            
            self.movie = []
            for dictionary in movieDictionaries {
                let movie = Movie(dictionary: dictionary)
                self.movies.append(movie)
            }
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
