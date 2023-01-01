//
//  CollectionViewCell.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 19.12.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var shareLabel: UIButton!
    
    var shareButtonCallBack: (() -> ())?
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        imageView.layer.cornerRadius = 12
        
        shareLabel.setImage(UIImage(named: "share_post"), for: .normal)
        shareLabel.setTitle("", for: .normal)
        
        headLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        timeLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        lessonLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.5)
    }
    
    @IBAction func shareAct(_ sender: Any) {
        shareButtonCallBack?()
    }
    
}
