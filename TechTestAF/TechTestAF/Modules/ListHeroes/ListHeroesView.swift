//
//  ListHeroesView.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ListHeroesView: BaseViewController, ListHeroesViewContract {

    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: ListHeroesPresenterContract!

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    func setupView() {
        let cellName = String(describing: HeroCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        collectionView.dataSource = self

    }
}

extension ListHeroesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellName = String(describing: HeroCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)

        return cell
    }
}
