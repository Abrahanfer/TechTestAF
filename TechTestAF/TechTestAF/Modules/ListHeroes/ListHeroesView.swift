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
    var presenter: ListHeroesPresenterContract?

    private let minIteritemSpacing = 30.0
    private let cellWidth = 143.0
    private let cellHeigh = 212.0

    override func loadView() {
        super.loadView()
        title = "Heroes"
    }

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.showActivityIndicator()
        self.presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    func setupView() {
        let cellName = String(describing: HeroCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumInteritemSpacing = minIteritemSpacing
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self

    }

    func updateListWithNewElements() {
        self.stopActivityIndicator()
        collectionView.reloadData()
    }
}

extension ListHeroesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let heroesCount = presenter?.getHeroesCount() else {
            return 0
        }
        return heroesCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellName = String(describing: HeroCollectionViewCell.self)
        // swiftlint:disable:next force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! HeroCollectionViewCell
        guard let hero = try? presenter?.getHeroAtPosition(position: indexPath.item) else {
            assert(false, "SHOUL RECEIVE HERO OBJECT")
            return UICollectionViewCell()
        }
        cell.setHeroData(hero: hero)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard let totalCountItems = presenter?.getHeroesCount() else {
            return
        }

        if indexPath.item == totalCountItems - 1 {
            self.showActivityIndicator()
            presenter?.getPageForItem(itemIndex: indexPath.item + 2)
        }
    }
}

extension ListHeroesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeigh)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalWidth = cellWidth * 2.0
        let totalSpacingWidth = minIteritemSpacing * 1
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 10.0, left: leftInset, bottom: 10.0, right: rightInset)
    }
}

extension ListHeroesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.selectItem(position: indexPath.item)
    }
}
