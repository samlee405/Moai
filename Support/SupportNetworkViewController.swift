//
//  SupportNetworkViewController.swift
//  Support
//
//  Created by Sam Lee on 2/18/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class SupportNetworkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var supportNetwork = [User(type: .support, name: "Sam", username: "samlee405", description: "How can I help?"),
                          User(type: .support, name: "Nabil", username: "nabil405", description: "Yo what up")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        getSupportNetwork()
    }

    func getSupportNetwork() {
        // call to backend
        // update supportNetworkArray
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportNetwork.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserCell()
        
        // configure cell
        cell.selectionStyle = .none
        cell.name?.text = supportNetwork[indexPath.row].name!
        cell.userDescription?.text = supportNetwork[indexPath.row].description!
//        cell.profileImage = supportNetwork[indexPath.row].profileImage
        
        return cell
    }

}
