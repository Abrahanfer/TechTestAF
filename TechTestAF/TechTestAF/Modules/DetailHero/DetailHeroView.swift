//
//  DetailHeroView.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 9/2/22.
//  Copyright © 2022 Abrahanfer.me. All rights reserved.
//
//

import UIKit

class DetailHeroView: BaseViewController, DetailHeroViewContract {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!
    @IBOutlet weak var heroMoreInfo: UILabel!

    var presenter: DetailHeroPresenterContract?

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    func setupView() {
        heroImage.image = nil
        heroName.text = ""
        heroDescription.text = ""
        heroMoreInfo.text = ""

    }

    func setImage(image: URL) {
        heroImage.sd_setImage(with: image, completed: nil)
    }

    func setMainText(mainText: String) {
        heroName.text = mainText
    }

    func setDescription(text: String) {
        heroDescription.text = text
    }

    func setMoreInfo(text: String) {
        heroMoreInfo.text = text
    }
}
