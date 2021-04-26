//
//  PhotoCollectionViewCell.swift
//  instagram-explore
//
//  Created by Willa on 06/03/21.
//

import UIKit
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    var url: URL?{
        didSet{
            self.imageOutlet.af.setImage(withURL: url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
