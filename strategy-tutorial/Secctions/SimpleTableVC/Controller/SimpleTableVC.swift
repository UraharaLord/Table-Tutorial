//
//  SimpleTableVC.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 16/05/23.
//

import UIKit
import ghmjolnircore
import TinyConstraints

class SimpleTableVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var containerForTableView: UIView!
    
    // MARK: - Properties
    var refreshControll: Bool = false
    
    internal lazy var tableViewController: GHStrategyTableController = {
        let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
        
        if refreshControll {
            tableViewController.addRefreshControl()
        }
        
        tableViewController.delegate = self
        return tableViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
    }
    
    // MARK: - Fill Table
    func setDataSource() {
        
        self.tableViewController.setSource(listSource: SimpleEntity.init().getDataForTable())
        
        if !self.tableViewController.tableView.isDescendant(of: self.containerForTableView) {
            
            self.tableViewController.delegate = self
            self.containerForTableView.addSubview(self.tableViewController.tableView)
            self.tableViewController.tableView.edgesToSuperview()
        }
        
        self.tableViewController.endRefreshing()
    }
    
    // MARK: - Action
    @IBAction func CloseAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension SimpleTableVC: GHStrategyTableControllerDelegate {
    
    func itemSelected(model: GHModelSimpleTableDelegate) {
        dump(model)
        
        guard let model = model as? SimpleEntity else {
            return
        }
        simpleAlert(title: "Atención", message: "\(model.description ?? "") seleccionado")
    }
    
    func fetchRefreshData() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                self.setDataSource()
            }
        }
    }
}
