//
//  InfoCardCell.swift
//  strategy-tutorial
//
//  Created by Uriel Rodriguez on 22/05/23.
//

import UIKit
import ghmjolnircore

class InfoCardCell: UITableViewCell {

    @IBOutlet weak var descriptionItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension InfoCardCell: GHSimpleTableViewCellDelegate {
    
    func bind(model: GHModelSimpleTableDelegate) {
        guard let model = model as? MyModelRow else {
            return
        }
        
        descriptionItem.text = model.description
//        imageItem.loadUrlImage(urlString: model.icon ?? "")
    }
}

