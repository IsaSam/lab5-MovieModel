//
//  Movie.swift
//  FlixApp
//
//  Created by Isaac Samuel on 11/12/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var posterUrl: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        // Set the rest of the properties
    }
}
