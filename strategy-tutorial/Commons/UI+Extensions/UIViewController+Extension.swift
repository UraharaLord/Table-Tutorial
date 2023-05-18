//
//  UIViewController+Extension.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 17/05/23.
//

import UIKit

enum NavigationMethod {
    case push
    case present
}

extension UIViewController {

    func navigateTo(identifier: String!, method: NavigationMethod, storyboard: String!) {
        DispatchQueue.main.async {
            let sBoard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
            let vctrl = sBoard.instantiateViewController(withIdentifier: identifier)
            
            switch method {
                case (.push):
                    self.navigationController?.pushViewController(vctrl, animated: true)
                    
                case (.present):
                    self.present(vctrl, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Alerts
    /// This method shows an alert
    /// - Parameters:
    /// - title: title to show
    /// - message: Descripton Message
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
