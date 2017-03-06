//
//  secondFlowView.swift
//  Vruster
//
//  Created by Hiso3D on 3/4/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit


class secondFlowView: UIView {
    
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var SignInButton: UIButton!
    var delegate : SecondFlowViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setUpUI()
    }
    
    func setUpUI() {
        
        SignUpButton.layer.cornerRadius = 20
        SignUpButton.clipsToBounds = true
        SignInButton.layer.cornerRadius = 20
        SignInButton.clipsToBounds = true
                
    }
    
    @IBAction func didPressSignupButton(sender: UIButton) {
    
        delegate?.didPressSignup()
        
        
    }
    @IBAction func didPressSigninButton(sender: UIButton) {
     
        delegate?.didPressSignin()
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

protocol SecondFlowViewDelegate {
    
    func didPressSignup()
    func didPressSignin()
    
}
