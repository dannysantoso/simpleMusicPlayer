//
//  MusicTableViewCell.swift
//  musicPlaylist
//
//  Created by danny santoso on 09/05/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var photoMusic: UIImageView!
    @IBOutlet weak var nameMusic: UILabel!
    @IBOutlet weak var artistMusic: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
