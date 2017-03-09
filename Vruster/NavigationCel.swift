//
//  NavigationCel.swift
//  Vruster
//
//  Created by Hiso3D on 3/10/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class NavigationCel: UICollectionViewCell {
    
    var textToAdd : String?
    
    
    
    func setUpUI(selected : Bool) {
    
        
        self.subviews[0].removeFromSuperview()
        let label : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        guard let text = textToAdd else {
            return
        }
        
        
        
        addSubview(label)
        label.text = textToAdd
        label.textAlignment = .center
        if selected {
        
         label.textColor = UIColor().getRGB(r: 234,g: 74,b: 74,alpha: 0.7)
        
        }else{
        
         label.textColor = UIColor().getRGB(r: 209,g: 209,b: 209,alpha: 0.7)

        
        }
//        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        
    }


}
