//
//  Movie.swift
//  
//
//  Created by Elijah Kumi on 3/3/18.
//

import Foundation

class Movie {
    // Create properties for the data you want to retrieve for the API
    
    var title: String
    var overview: String
    var releaseDate: String
    var baseURLString: String
    var posterPathString: String
    var backdropPathString: String
    var backdropURL: URL
    var posterURL: URL
    
    // Create an array of movies
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
    init(dictionary: [String:Any]) {
        title = dictionary["title"] as? String ?? "No Title";
        overview = dictionary["overview"] as? String ?? "No Description";
        releaseDate = dictionary["release_date"] as? String ?? "No Date";
        
        //Getting the poster and backdrop images
        baseURLString = "https://image.tmdb.org/t/p/w500";
        posterPathString = dictionary["poster_path"] as! String
        backdropPathString = dictionary["backdrop_path"] as! String
        posterURL = URL(string: baseURLString + posterPathString)!
        backdropURL = URL(string: baseURLString + backdropPathString)!
    }
    
}
