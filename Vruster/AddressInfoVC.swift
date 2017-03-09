//
//  AddressInfoVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/8/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class AddressInfoVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var Address1Field: UITextField!
    @IBOutlet var Address2Field: UITextField!
    @IBOutlet var TownField: UITextField!
    @IBOutlet var CountryField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    func setupUI() {
        
        CountryField.delegate = self
        TownField.delegate = self
        Address2Field.delegate = self
        Address1Field.delegate = self
        
        
    }
    
    
    //// text field delegation
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CountryField.resignFirstResponder()
        TownField.resignFirstResponder()
        Address2Field.resignFirstResponder()
        Address1Field.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        CountryField.resignFirstResponder()
        TownField.resignFirstResponder()
        Address2Field.resignFirstResponder()
        Address1Field.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dIsmiss(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
