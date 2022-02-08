//
//  ViewController.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 6/2/22.
//

import UIKit

class ViewController: UIViewController {
    let provider = HeroesProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        provider.getHeroes().done { heroes in
            print(heroes)
        }.catch { error in
            print(error)

        }
    }
}
