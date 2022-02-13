//
//  HeroCollectionViewCell.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//

import UIKit
import SDWebImage

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        heroImage.image = nil
        heroTitle.text = ""
    }

    func setHeroData(hero: Hero) {
        let thumbnailString = hero.getThumbnailStringFor(size: .portraitXLarge)
        if !thumbnailString.isEmpty, let urlImage = URL(string: thumbnailString) {
            heroImage.sd_setImage(with: urlImage, completed: nil)
        }
        heroTitle.text = hero.name
    }

}
