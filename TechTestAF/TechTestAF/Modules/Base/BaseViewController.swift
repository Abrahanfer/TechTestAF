//
//  BaseViewController.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//

import Foundation
import UIKit
import SnapKit

class BaseViewController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView?

    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        self.view.addSubview(activityIndicator!)
        activityIndicator?.snp.makeConstraints { make in
            make.width.height.equalTo(25.0)
            make.center.equalToSuperview()
        }
        self.view.bringSubviewToFront(activityIndicator!)
        activityIndicator?.startAnimating()
    }

    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
}
