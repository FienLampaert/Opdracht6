//
//  cell.swift
//  Opdracht6
//
//  Created by student on 12/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit

class cell: UITableViewCell {

    @IBOutlet var descriptionTitle: UILabel!
    @IBOutlet var bidSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
