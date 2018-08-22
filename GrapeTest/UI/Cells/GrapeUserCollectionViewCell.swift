//
//  GrapeUserCollectionViewCell.swift
//  GrapeTest
//
//  Created by Alexander Posvanc on 21.08.18.
//  Copyright © 2018 grape. All rights reserved.
//

import UIKit

protocol DeleteButtonDelegate{
    func deleteButtonPressed(at index:IndexPath)
}

class GrapeUserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    private var indexPath : IndexPath = []
    var delegate : DeleteButtonDelegate!

    /* Setting up cell for selected user collection cell
        Input for user object to set up view
        Index path for knowing which item to delete
        Delegate that calls back to the viewcontroller */
    func setUpCellWithUser(user : GrapeUser , indexPath : IndexPath, delegate: DeleteButtonDelegate){
        userImage.image = UIImage(named: user.image)
        userNameLabel.text = user.name
        self.indexPath = indexPath
        self.delegate = delegate
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        delegate.deleteButtonPressed(at: indexPath)
    }
    
}
