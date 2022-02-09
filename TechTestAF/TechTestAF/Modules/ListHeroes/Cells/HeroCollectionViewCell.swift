//
//  HeroCollectionViewCell.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        backgroundColor = .blue
    }

}
