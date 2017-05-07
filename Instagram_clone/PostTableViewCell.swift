//
//  PostTableViewCell.swift
//  Instagram_clone
//
//  Created by 高崎 慶輔 on 2017/04/22.
//  Copyright © 2017年 Keisuke Takasaki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentPostButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
        if postData.comments.isEmpty == false {
            var tempComment: String = ""
            for comments in postData.comments {
                if tempComment != "" {
                    tempComment = tempComment + "\n\(comments.key) : \(comments.value)"
                } else {
                    tempComment = "\(comments.key) : \(comments.value)"
                }
            }
            self.commentLabel.text = tempComment
        } else {
            self.commentLabel.text = ""
        }
    }
}
