//
//  PersonalInfoVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/8/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
