//
//  SimpleCell.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 16/05/23.
//

import UIKit
import ghmjolnircore

class SimpleCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SimpleCell: GHSimpleTableViewCellDelegate {
    
    func bind(model: GHModelSimpleTableDelegate) {
        guard let model = model as? SimpleEntity else {
            return
        }
        
        descriptionLbl.text = model.description
        imageItem.loadUrlImage(urlString: model.icon ?? "")
    }
}
