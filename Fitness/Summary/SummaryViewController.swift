//
//  HomeViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/10/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class SummaryNavigationController: UINavigationController {
    
    
    
}

class SummaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        let search = UISearchController(searchResultsController: nil /* TODO: Search Results Controller */)
        
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        self.navigationItem.searchController = search
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


class SummaryViewTabBarItem: UITabBarItem {
    
    
    
}
