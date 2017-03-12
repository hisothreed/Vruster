//
//  ProductsVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/10/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the vie
        table.dataSource = self
        table.delegate = self
        table.estimatedRowHeight = 100
        table.frame.size.width = self.view.frame.size.width - 40
        table.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        table.backgroundColor = UIColor().getRGB(r: 247, g: 247, b: 247, alpha: 1)
        
        table.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")

    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.contentView.frame.size.width = self.view.frame.width - 40
        
        return cell
        
    }
    
}
