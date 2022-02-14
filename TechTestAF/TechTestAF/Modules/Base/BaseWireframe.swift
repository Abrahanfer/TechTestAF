//
//  BaseWireframe.swift
//  TechTestAF
//
//  Created by Abrahán Fernández on 8/2/22.
//

import Foundation
import UIKit

class BaseWireframe {
    func showAlertForError(error: String, view: UIViewController) {
        let basicErrorAlert = UIAlertController(title: "",
                                                message: error,
                                                preferredStyle: .alert)

        basicErrorAlert.addAction(UIAlertAction(title: "Aceptar",
                                                style: .default,
                                                handler: nil))
        
        view.present(basicErrorAlert, animated: true, completion: nil)
    }
}
