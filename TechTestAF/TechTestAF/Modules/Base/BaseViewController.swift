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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator?.style = UIActivityIndicatorView.Style.large
        activityIndicator?.color = UIColor(named: "ForegroundColor")
        activityIndicator?.backgroundColor = UIColor(named: "ForegroundAlphaColor")
        self.view.addSubview(activityIndicator!)
        activityIndicator?.snp.makeConstraints { make in
            make.width.height.equalToSuperview()//(25.0)
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

class BaseNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
