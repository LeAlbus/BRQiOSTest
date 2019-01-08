//
//  DetailsViewController.swift
//  MovieList
//
//  Created by Joao Pedro Lopes Felix da Silva on 08/01/19.
//  Copyright © 2019 Joao Pedro Lopes Felix da Silva. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    let loading: UIActivityIndicatorView = UIActivityIndicatorView()

    let detailViewModel = MovieDetailsVM()
    
    func movieID(id: String){
     
        self.detailViewModel.delegate = self
        self.detailViewModel.movieID = id
    }
    
    func displayErrorMessage(error: String?){
        print (error ?? "nil")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loading.center = self.view.center
        self.loading.hidesWhenStopped = true
        //self.loading.style = .gray
        
        self.view.addSubview(loading)
        
        self.loading.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        self.detailViewModel.searchMovie()
    }
    
    func setupView(with movie: MovieDetails){
        
        self.titleLabel.text = movie.title
        self.genreLabel.text = movie.genre
        self.directionLabel.text = "Direction: \(movie.direction)"
        self.castLabel.text = "Cast: \(movie.cast)"
        self.releaseLabel.text = movie.released
        
        self.loading.stopAnimating()
        self.blurView.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
        
        self.detailViewModel.getMovieImage(from: movie.posterURL)
    }
    
    func setPosterImage(_ image: UIImage){
        
        self.posterImageView.image = image
    }
    
    func posterNotFound(){
        self.posterImageView.alpha = 0.3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}
