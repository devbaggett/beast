//
//  BeastCell.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

class BeastCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func buttonPressed(cell: BeastCell) {
//        let indexPath = tableView.indexPath(for: cell)
//    }
}
