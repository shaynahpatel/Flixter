//
//  MoviesViewController.swift
//  Flixter
//
//  Created by Shayna Patel on 2/1/19.
//  Copyright © 2019 shaynahpatel@gmail.com. All rights reserved.
//

import UIKit
import AlamofireImage


class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //step 1: add the extra purple ones
    
    //step 2: create the outlet
    @IBOutlet weak var tableView: UITableView!
    
    //properties
    var movies = [[String:Any]]()  //creation of an array of dictionaries

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //step 3: do this idk why tho
        tableView.delegate = self
        tableView.dataSource = self
        
        print("hello")
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]] //hey movies look in the datadictionary and get out results and cast it as an array of dictionaries. now you have a movies stored in a property that's availiable in other functions
                
                //step 5: so the data remains there
                self.tableView.reloadData()
                
                print(dataDictionary)
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    //step 4: inplement these two functions which should appear automatically after you do step 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //lets you access the outlets and reuse cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        //get the current movie
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.lblTitle.text = title
        cell.lblSynopsis.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.imgPoster.af_setImage(withURL: posterUrl!)
        
        
        return cell
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
