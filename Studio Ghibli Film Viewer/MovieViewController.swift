//
//  MovieViewController.swift
//  Studio Ghibli Film Viewer
//
//  Created by Evan Bakkal on 2/24/22.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var origTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    var movie: MovieInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie?.title
        origTitleLabel.text = movie?.original_title
        descriptionLabel.text = movie?.description
        releaseDateLabel.text = movie?.release_date
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
