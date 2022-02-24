//
//  ViewController.swift
//  Studio Ghibli Film Viewer
//
//  Created by Evan Bakkal on 2/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var movies = [MovieInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("Successful")
        }
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.movies = try JSONDecoder().decode([MovieInfo].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
}

