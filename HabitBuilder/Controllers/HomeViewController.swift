//
//  TableViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 14.12.22.
//

import UIKit

class HomeViewController: MainVC {

    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset.bottom = 80
        tableView.verticalScrollIndicatorInsets.bottom = 80
        tableView.contentInset.top = 0
    }
    
//    func shareButtonAction() {
//        print("button tapped")
//    }
//
//    func profileButtonAction() {
//        print("button tapped")
//    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        164
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityTableViewCell", for: indexPath) as? CommunityTableViewCell {
           // cell.delegate = self
            cell.shareButtonCallback = {
                print("share button tapped")
            }
            
            cell.profileButtonCallback = {
                print("profile image tapped")
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell is tapped")
    }
    
    
}
