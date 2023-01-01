//
//  CoursesViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 09.12.22.
//

import UIKit
import DropDown

class CoursesViewController: MainVC {
    
    @IBOutlet weak var dropDownContentView: UIView!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    @IBOutlet weak var popularLabel: UILabel!
    @IBOutlet weak var buttonAct: UIButton!
    
    @IBOutlet weak var dropDownHeaderView: UIView!
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private var cellHeight: CGFloat = 33
    private var cellCount: Int = 4
    
    var items = ["name 1", "name 2", "name 3", "name 4", "name 5"]
    
    let myDropDown = DropDown()
    let value = ["value 1", "value 2", "value 3", "value 4", "value 5"]
    
    var imageArr = ["image_one", "image_two"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        tickImage.isUserInteractionEnabled = true
        tickImage.addGestureRecognizer(tap)
        
        buttonAct.setTitle("", for: .normal)
        buttonOutlet.setTitle("Filters", for: .normal)
        
        myDropDown.anchorView = uiView
        myDropDown.dataSource = value
        
        myDropDown.bottomOffset = CGPoint(x: 0, y: (myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.topOffset = CGPoint(x: 0, y: -(myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.direction = .bottom
        
        dropDownHeaderView.layer.borderWidth = 0.5
        dropDownHeaderView.layer.cornerRadius = 12
        
        tableView.layer.borderWidth = 0.5
        tableView.layer.cornerRadius = 12
        
        uiView.layer.borderWidth = 0.5
        uiView.layer.cornerRadius = 12
        
        if cellCount > items.count {
            cellCount = items.count
        }
    }
    
    @IBAction func buttonAct(_ sender: Any) {
        myDropDown.show()
    }
    
    @objc func didTapButton() {
        if viewBottom.constant == 0 {
            viewBottom.constant = cellHeight * CGFloat(cellCount)
        } else {
            viewBottom.constant = 0
        }
           
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.tableView.flashScrollIndicators()
        }
    }
    
    @IBAction func button(_ sender: Any) {
        if viewBottom.constant == 0 {
            viewBottom.constant = cellHeight * CGFloat(cellCount)
        } else {
            viewBottom.constant = 0
        }
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.tableView.flashScrollIndicators()
        }
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       print("cell tapped")
        
        popularLabel.text = items[indexPath.row]
    }
}

extension CoursesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: imageArr[indexPath.row])
        return cell
    }
}

