 //
//  TableViewCell.swift
//  Flix_app
//
//  Created by Elijah Kumi on 2/4/18.
//  Copyright © 2018 Elijah Kumi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var movie: Movie! {
        
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            posterimageView.af_setImage(withURL: movie.posterURL)
            
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterimageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
