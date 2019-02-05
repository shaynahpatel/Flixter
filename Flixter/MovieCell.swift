//
//  MovieCell.swift
//  Flixter
//
//  Created by Shayna Patel on 2/2/19.
//  Copyright © 2019 shaynahpatel@gmail.com. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSynopsis: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
