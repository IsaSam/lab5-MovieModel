//
//  MovieCell.swift
//  FlixApp
//
//  Created by Isaac Samuel on 9/18/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var MoviesImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movies: Movie!{
        didSet {
            titleLabel.text = movies.title
            overviewTextView.text = movies.overview
            //if let posterPath = movie["poster_path"] as? String{
            
                let posterBaseUrl = "https://image.tmdb.org/t/p/w500"
                let posterPathUrl = URL(string:  posterBaseUrl + movies.posterUrl!)
                MoviesImageView.af_setImage(withURL: posterPathUrl!)
            
            }
            // // let posterpathURL = URL(string: baseUrlString + movies.posterUrl!)!
            // // posterImageView.af_setImage(withURL: posterpathURL)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
