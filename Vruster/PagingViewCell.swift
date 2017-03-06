//
//  PagingViewCell.swift
//  Vruster
//
//  Created by Hiso3d on 2/4/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class PagingViewCell: UICollectionViewCell {
    
   @IBOutlet weak var PageImage : UIImageView!
   @IBOutlet weak var LogoImage : UIImageView!
   @IBOutlet weak var Text: UILabel!
    
    override func awakeFromNib() {
    
        LogoImage.image = UIImage(named: "logo")
        
        Text.contentMode = .scaleAspectFit
        Text.numberOfLines = 0 
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
