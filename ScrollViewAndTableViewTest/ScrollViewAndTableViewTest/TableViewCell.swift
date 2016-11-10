//
//  TableViewCell.swift
//  ScrollViewAndTableViewTest
//
//  Created by Denny on 10/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myContent: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
