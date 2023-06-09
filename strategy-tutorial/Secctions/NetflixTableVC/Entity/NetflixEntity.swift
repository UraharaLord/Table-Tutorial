//
//  NetflixEntity.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 31/05/23.
//

import Foundation

struct NetflixEntity {
    let id: String?
    let title: String?
    let subTitle: String?
    let description: String?
    let image: String?
    
    internal init(id: String? = nil, title: String? = nil, subTitle: String? = nil, description: String? = nil, image: String? = nil) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.image = image
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
