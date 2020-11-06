//
//  TitleCollectionViewCell.swift
//  DynamicWidthCollectionViewCelltest
//
//  Created by saw pyaehtun on 06/11/2020.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupItem(title : String){
        lblTitle.text = title
    }
}
