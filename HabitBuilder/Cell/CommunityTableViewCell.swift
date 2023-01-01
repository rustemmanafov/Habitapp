//
//  CommunityTableViewCell.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 15.12.22.
//

import UIKit

//protocol CommunityTableViewCellDelegate {
//    func shareButtonAction()
//    func profileButtonAction()
//}

class CommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var shareButtonLabel: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageCountLabel: UILabel!
    
   // var delegate: CommunityTableViewCellDelegate?
    
    var profileButtonCallback: (() -> ())?
    var shareButtonCallback: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        uiView.layer.cornerRadius = 10
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tap)
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        //delegate?.shareButtonAction()
        shareButtonCallback?()
    }
    
    @objc func imgTapped() {
       // delegate?.profileButtonAction()
        profileButtonCallback?()
    }
    
    
    
}
