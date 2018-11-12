//
//  Movie.swift
//  FlixApp
//
//  Created by Isaac Samuel on 11/12/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import Foundation
import AlamofireImage

class Movie{
    var movies: [Movie] = []
    var title: String
    //var posterUrl: URL?
    var posterUrl: String?
    var overview: String?
    var backdropPathString: String?
    var posterPathString: String?
    var backDropImageView: String?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        // Set the rest of the properties
        
        posterUrl = dictionary["poster_path"] as? String
        overview = (dictionary["overview"] as? String)!
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
