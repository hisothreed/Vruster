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
        table.rowHeight = 60
        table.backgroundColor = UIColor().getRGB(r: 247, g: 247, b: 247, alpha: 1)

        table.sectionHeaderHeight = 40
        table.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
			
    }
    

    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : UIView = UIView()
        headerView.frame = CGRect(x: 20, y: 0, width: self.view.frame.width, height: 40)
        let label : UILabel =  {
            let l = UILabel()
            l.frame = headerView.frame
            l.font = UIFont(name: "Avenir-Heavy", size: 10)
            l.text = "Recommended For You"
            return l
        }()
        
        headerView.addSubview(label)

        return headerView
        
    }
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.contentView.backgroundColor = UIColor().getRGB(r: 247, g: 247, b: 247, alpha: 1)
        return cell
        
    }
    
}
