//
//  MovieViewController.swift
//  Studio Ghibli Film Viewer
//
//  Created by Evan Bakkal on 2/24/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

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
        
//        let imageLink = movie?.image ?? "Failure"
        let imageLink = movie?.movie_banner ?? "Failure"
        imageView.downloaded(from: imageLink)
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
