//
//  GrapeUserTableViewCell.swift
//  GrapeTest
//
//  Created by Alexander Posvanc on 21.08.18.
//  Copyright © 2018 grape. All rights reserved.
//

import UIKit

class GrapeUserTableViewCell: UITableViewCell {
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var checkmarkImage: UIImageView!
    
    /* Setting up cell for list with all users */
    func setUpCellWithUser(user : GrapeUser , selected : Bool){
        userImage.image = UIImage(named: user.image)
        userNameLabel.text = user.name
        checkmarkImage.isHidden = !selected
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
