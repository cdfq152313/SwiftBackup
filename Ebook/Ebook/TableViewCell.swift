//
//  TableViewCell.swift
//  Ebook
//
//  Created by Denny on 2016/9/21.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var bookimageView: UIImageView!
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var authorLabelView: UILabel!
    @IBOutlet weak var priceLabelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
