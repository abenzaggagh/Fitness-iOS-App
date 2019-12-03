//
//  HomeViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/10/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        let search = UISearchController(searchResultsController: nil /* TODO: Search Results Controller */)
        
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        self.navigationItem.searchController = search
        
        // TODO: Left Profile Button
        
        // TEST DB CONNECTION
        
//        let path = "http://localhost:4000/user/5de43169f427e00c06dc505d"
//
//        let url = URL(string: path)!
//
//        let defaultSession = URLSession(configuration: .default)
//
//        let task = defaultSession.dataTask(with: url, completionHandler: { data, response, error in
//
//            print(data)
//
//        })
//        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func profile(_ sender: Any) {
        
    }
    

}
