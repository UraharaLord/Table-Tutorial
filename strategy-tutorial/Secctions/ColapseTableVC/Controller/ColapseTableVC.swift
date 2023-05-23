//
//  ColapseTableVC.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 23/05/23.
//

import UIKit

class ColapseTableVC: UIViewController {

    @IBOutlet weak var containerForTableView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAct(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
