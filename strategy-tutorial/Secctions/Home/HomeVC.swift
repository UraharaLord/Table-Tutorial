//
//  HomeVC.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 16/05/23.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func simpleTableAct(_ sender: Any) {
        navigateTo(identifier: "SimpleTableID", method: .present, storyboard: "SimpleList")
    }
    
    @IBAction func pullToRefresh(_ sender: Any) {
        DispatchQueue.main.async {
            let sBoard: UIStoryboard = UIStoryboard(name: "SimpleList", bundle: nil)
            let vctrl = sBoard.instantiateViewController(withIdentifier: "SimpleTableID") as! SimpleTableVC
                vctrl.refreshControll = true
            self.present(vctrl, animated: true, completion: nil)
        }
    }
    
    @IBAction func headerTable(_ sender: Any) {
        navigateTo(identifier: "HeaderTableID", method: .present, storyboard: "HeaderTable")
    }
}
