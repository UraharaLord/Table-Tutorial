//
//  SimpleEntity.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 16/05/23.
//

import Foundation
import ghmjolnircore

struct SimpleEntity {
    
    let id: String?
    let icon: String?
    let description: String?
    
    internal init(id: String? = nil, icon: String? = nil, description: String? = nil) {
        self.id = id
        self.icon = icon
        self.description = description
    }
    
    func getDataForTable() -> [SimpleEntity] {
        var array: [SimpleEntity] = []
        
        let urlStr: String = "https://retos-operaciones-logistica.eae.es/wp-content/uploads/2020/01/proyectos-tecnologicos-600x300.jpg"
        
        for (index, _) in (1...30).enumerated() {
            array.append(SimpleEntity(id: "\(index)",
                                    icon: urlStr,
                             description: "Elemento número \(index)"))
        }
        
        return array
    }
}

extension SimpleEntity: GHModelSimpleTableDelegate {
    var reuseIdentifier: String {
        SimpleCell.id
    }
}
