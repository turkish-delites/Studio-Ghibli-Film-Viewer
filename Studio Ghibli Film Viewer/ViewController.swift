//
//  ViewController.swift
//  Studio Ghibli Film Viewer
//
//  Created by Evan Bakkal on 2/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var movies = [MovieInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
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

