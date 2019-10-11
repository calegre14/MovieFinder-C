//
//  CMAMovieTableViewCell.swift
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class CMAMovieTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    
    //MARK:- Properties
    var movie: CMAMovieCollection? {
        didSet {
            updateViewForMovie()
        }
    }
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- Custom Functions
    func updateViewForMovie() {
        guard let movie = movie else {return}
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.vote.doubleValue)"
        movieOverviewTextView.text = movie.overview
    }
}
