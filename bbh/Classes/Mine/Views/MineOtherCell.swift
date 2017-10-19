//
//  MineOtherCell.swift
//  bbh
//
//  Created by Leo on 2017/10/9.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class MineOtherCell: UITableViewCell, RegisterCellOrNib {
    
    /// 标题
    @IBOutlet weak var leftlabel: UILabel!
    
    /// 右侧标签
    @IBOutlet weak var rightlabel: UILabel!
    
    var mineCellModel: MineCellModel? {
        didSet {
            leftlabel.text = mineCellModel?.text
            rightlabel.text = mineCellModel?.grey_text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
