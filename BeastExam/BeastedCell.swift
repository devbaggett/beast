//
//  BeastedCell.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/21/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

class BeastedCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
