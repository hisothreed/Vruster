//
//  sideView.swift
//  Vruster
//
//  Created by Hiso3D on 4/28/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class sideView: UIView,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var searchField: UITextField!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userMail: UILabel!
    
    @IBOutlet var optionsTable: UITableView!
    
    var options = ["Shopping List","Sale","History","How to Pay","Settings","Log Out"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userName.text = "Hussein Al Saadi"
        self.userMail.text = "Hussein@ibtmena.com"
        self.userImage.image = UIImage(named: "profile")
        self.userImage.clipsToBounds = true
        self.userImage.layer.cornerRadius = 35
        let imageView = UIImageView(image: UIImage(named: "searchIcon")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = UIColor.gray
        
        let leftView = UIView()
        leftView.addSubview(imageView)
        leftView.frame = CGRect(x:0, y:0, width:30, height:25)
        imageView.frame = CGRect(x:4, y:4, width:15, height:15)
        
        self.searchField.leftViewMode = .always
        self.searchField.leftView = leftView

        optionsTable.delegate = self
        optionsTable.dataSource = self
        optionsTable.rowHeight = 60
        optionsTable.backgroundColor = .clear
        optionsTable.separatorColor = .clear
        optionsTable.register(sideViewTableCell.self, forCellReuseIdentifier: "sideCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell", for: indexPath) as! sideViewTableCell
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont (name: "HelveticaNeue-UltraLight", size: 20)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    
    
}
