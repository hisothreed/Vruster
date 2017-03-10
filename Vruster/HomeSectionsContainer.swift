//
//  HomeSectionsContainer.swift
//  Vruster
//
//  Created by Hiso3D on 3/10/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class HomeSectionsContainer: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
        
        
    }
    
    func setUpUI() {
    
        

        let table = ProductsVC(nibName: "ProductsVC", bundle: nil)
        self.addSubview(table.view)
        table.table.reloadData()

        
        
    }
    
    
    
}
