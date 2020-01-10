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
    
    @IBOutlet weak var summaryScrollView: UIScrollView!
    @IBOutlet var summaryContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryScrollView.addSubview(summaryContentView)
   
        summaryScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        summaryContentView.topAnchor.constraint(equalTo: summaryScrollView.topAnchor).isActive = true
        summaryContentView.leadingAnchor.constraint(equalTo: summaryScrollView.leadingAnchor).isActive = true
        summaryContentView.trailingAnchor.constraint(equalTo: summaryScrollView.trailingAnchor).isActive = true
        summaryContentView.bottomAnchor.constraint(equalTo: summaryScrollView.bottomAnchor).isActive = true
        
        summaryContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
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
    
    @IBAction func profile(_ sender: Any) {
        
    }
    

}
