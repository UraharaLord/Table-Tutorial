//
//  MyModel.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 23/05/23.
//

import Foundation
import ghmjolnircore

struct MyModelRow {
    
    let id: String?
    let icon: String?
    let description: String?
    
    internal init(id: String? = nil, icon: String? = nil, description: String? = nil) {
        self.id = id
        self.icon = icon
        self.description = description
    }
    
    func getDataForTable() -> [GHModelTableSectionDelegate] {
        var array: [ModelSection] = []
        
        let urlStr: String = "https://retos-operaciones-logistica.eae.es/wp-content/uploads/2020/01/proyectos-tecnologicos-600x300.jpg"
        var miModel: [MyModelRow] = []
        
        
        for (index, _) in (1...10).enumerated() {
            miModel.append(MyModelRow(id: "\(index)",
                                    icon: urlStr,
                             description: "Elemento número \(index)"))
        }
                
        array.append(ModelSection(titleSection: "Mi header seccion 1", listSection: miModel))
        
        for (index, _) in (1...10).enumerated() {
            miModel.append(MyModelRow(id: "\(index)",
                                    icon: urlStr,
                             description: "Elemento número \(index)"))
        }
                
        array.append(ModelSection(titleSection: "Mi header seccion 2", listSection: miModel))
        
        return array
    }
}

struct ModelSection: GHModelTableSectionDelegate {
    var titleSection: String?
    var listSection: [GHModelSimpleTableDelegate]?
    
    init(titleSection: String?, listSection: [GHModelSimpleTableDelegate]?) {
        self.titleSection   = titleSection
        self.listSection    = listSection
    }
}

extension MyModelRow: GHModelSimpleTableDelegate {
    public var reuseIdentifier: String {
        InfoCardCell.id
    }
    
    var bundle: Bundle? {
        .main
    }
}

