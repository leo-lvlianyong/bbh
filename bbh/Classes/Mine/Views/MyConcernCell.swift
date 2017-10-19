//
//  MyConcernCell.swift
//  bbh
//
//  Created by Leo on 2017/10/9.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class MyConcernCell: UICollectionViewCell, RegisterCellOrNib  {

    @IBOutlet weak var avatarVImageView: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var myConcern: MyConcern? {
        didSet {
            imageView.kf.setImage(with: URL(string: (myConcern?.icon)!))
            nameLabel.text = myConcern?.name!
            if let isVerify = myConcern!.is_verify {
                avatarVImageView.isHidden = !isVerify
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
