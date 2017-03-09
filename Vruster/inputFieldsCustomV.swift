//
//  inputFieldsCustomV.swift
//  Vruster
//
//  Created by Hiso3D on 3/8/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class inputFieldsCustomV: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        
        
        setUpUI()
        
    }
    func setUpUI() {
        
        let line : UIView = {
        
            let l = UIView(frame: CGRect(x: 0, y: self.frame.height - 0.5, width: self.frame.width, height: 0.5))
            l.backgroundColor = UIColor().getRGB(r: 181, g: 183, b: 181, alpha: 0.5)

            return l
        }()
    
        self.addSubview(line)
        
    }
    
    
}
