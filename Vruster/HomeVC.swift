//
//  HomeVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/9/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var  NavCollectionView: UICollectionView!
    var pageIds : [String] = ["Cart","Shops","Scan"]
    var selectedRow : Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
        
    }


    func setUpUI()  {
        selectedRow = 1
        ///// collectionView layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        NavCollectionView.isPagingEnabled = false
        NavCollectionView.isScrollEnabled = true
        NavCollectionView.showsHorizontalScrollIndicator = false
        NavCollectionView.collectionViewLayout = layout
        NavCollectionView.delegate = self
        NavCollectionView.dataSource = self
        NavCollectionView.contentInset.left = 10
        NavCollectionView.contentOffset.x = 10
        /// load cells and add them
      
        NavCollectionView.register(NavigationCel.self, forCellWithReuseIdentifier: "NavCell")
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageIds.count
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        NavCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        NavCollectionView.reloadData()

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.NavCollectionView.frame.width/3 + 20, height: self.NavCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = NavCollectionView.dequeueReusableCell(withReuseIdentifier: "NavCell", for: indexPath) as! NavigationCel
        cell.textToAdd = nil
        cell.textToAdd = pageIds[indexPath.row]
        
        if indexPath.row == selectedRow {
       
        cell.setUpUI(selected: true)
            
        }else if indexPath.row != selectedRow {
         
         cell.setUpUI(selected: false)
         
     
        }
        return cell
        
    }

    
}
