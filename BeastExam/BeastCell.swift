//
//  BeastCell.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

protocol BeastedVCDelegate {
    func beastedPressed(_ indexPath: IndexPath)
}

class BeastCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var indexPath: IndexPath!
    var delegate: BeastedVCDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        delegate?.beastedPressed(indexPath)
    }
    
}
