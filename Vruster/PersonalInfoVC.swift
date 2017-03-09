//
//  PersonalInfoVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/8/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController, UITextFieldDelegate{

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var FirstNameField: UITextField!
    @IBOutlet var LastNameField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var PhoneNumberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        
        
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        
        EmailField.delegate = self
        FirstNameField.delegate = self
        LastNameField.delegate = self
        PasswordField.delegate = self
        PhoneNumberField.delegate = self
        
        
    }
    
    
    //// text field delegation
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        EmailField.resignFirstResponder()
        FirstNameField.resignFirstResponder()
        LastNameField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        PhoneNumberField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        EmailField.resignFirstResponder()
        FirstNameField.resignFirstResponder()
        LastNameField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        PhoneNumberField.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismiss(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func next(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressInfoVC")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
