//
//  HeaderTableVC.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 22/05/23.
//

import UIKit
import ghmjolnircore

class HeaderTableVC: UIViewController {

    @IBOutlet weak var containerForTableView: UIView!
    
    internal lazy var tableSectionCpntroller: GHStrategyTableSectionController = {
        let tableView = GHStrategyTableSectionController(nibList: [(InfoCardCell.id, .main)])
            tableView.cellDelegate = self
            tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableSectionCpntroller.setSource(listSource: MyModelRow.init().getDataForTable())
        
        setupView()
    }
    
    func setupView() {
        self.title = "MY Header"
        
        let heightSection = 52.0
        self.tableSectionCpntroller.setSectionView(heightSection: heightSection) { title in
            let view = UIView(frame: CGRect( x: 0,
                                             y: 0,
                                         width: self.containerForTableView.bounds.size.width,
                                        height: heightSection))
            
            view.backgroundColor = .systemOrange
            
            let label = UILabel(frame: CGRect( x: 0, y: 0, width: self.containerForTableView.bounds.size.width,height: heightSection))
                label.textColor = .darkGray
                label.textAlignment = .left
                label.numberOfLines = 0
                label.text = title
            
            view.addSubview(label)
            
            label.edgesToSuperview()
            
            return view
        }
        
        if !self.tableSectionCpntroller.tableView.isDescendant(of: self.containerForTableView) {
            self.tableSectionCpntroller.delegate = self
            self.tableSectionCpntroller.cellDelegate = self
            if let table = self.tableSectionCpntroller.tableView {
                
                self.containerForTableView.addSubview(table)
                self.containerForTableView.constraints(to: table)
            }
        }
    }
    
    @IBAction func closeAct(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension HeaderTableVC: GHStrategyTableControllerDelegate {
    func itemSelected(model: GHModelSimpleTableDelegate) {
        guard let model = model as? MyModelRow else { return }
        
        dump("esta es la card seleccionada")
        dump(model.description ?? "")
        
        simpleAlert(title: "Atención", message: model.description ?? "")
    }
}

extension HeaderTableVC: GHStrategyTableViewCellDelegate {
    func tapView(identifier: Int, data: Any?) {
        dump("este es el header")
    }
}

