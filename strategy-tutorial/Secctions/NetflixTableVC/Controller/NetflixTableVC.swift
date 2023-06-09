//
//  NetflixTableVC.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 30/05/23.
//

import UIKit
import ghmjolnircore

typealias NetflixTableDelegates = GHStrategyCollectionControllerDelegate & GHStrategyTableControllerDelegate

class NetflixTableVC: UIViewController {
    
    internal lazy var controllerNetflixList = GHStrategyNetflixTableSectionController(nibList: [("", .main)])
    internal lazy var controllerSimpleList = GHStrategyTableController(nibList: [("", .main)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NetflixTableVC: NetflixTableDelegates {
    
    func itemSelected(model: GHModelCollectionDelegate) {
        print("item in collection")
    }
    
    func itemSelected(model: GHModelSimpleTableDelegate) {
        print("item in Table")
    }
}
