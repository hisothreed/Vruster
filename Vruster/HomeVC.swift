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
    @IBOutlet weak var  SecCollectionView: UICollectionView!
    @IBOutlet weak var homeSectionsContainer : UIView!
    var pageIds : [String] = ["Cart","Shopping","Scan"]
    var sections : [String] = ["Best selling","Best Price","Stores","test"]
    var selectedRow : Int?
    var line : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
        
    }


    func setUpUI()  {
        selectedRow = 1
        ///// collectionView layout
        let NavLayout = UICollectionViewFlowLayout()
        NavLayout.scrollDirection = .horizontal
        NavLayout.minimumLineSpacing = 0
        NavLayout.minimumInteritemSpacing = 0
       
        NavCollectionView.isPagingEnabled = false
        NavCollectionView.isScrollEnabled = true
        NavCollectionView.showsHorizontalScrollIndicator = false
        NavCollectionView.collectionViewLayout = NavLayout
        NavCollectionView.delegate = self
        NavCollectionView.dataSource = self
        NavCollectionView.contentInset.left = -5
        NavCollectionView.register(NavigationCel.self, forCellWithReuseIdentifier: "NavCell")
        
        /////
        let secLayout = UICollectionViewFlowLayout()
        secLayout.scrollDirection = .horizontal
        secLayout.minimumLineSpacing = 0
        secLayout.minimumInteritemSpacing = 0
        SecCollectionView.isPagingEnabled = false
        SecCollectionView.isScrollEnabled = true
        SecCollectionView.showsHorizontalScrollIndicator = false
        SecCollectionView.collectionViewLayout = secLayout
        
        SecCollectionView.delegate = self
        SecCollectionView.dataSource = self
        SecCollectionView.register(SectionsCell.self, forCellWithReuseIdentifier: "SecCell")
        
        //shadow
        SecCollectionView.layer.shadowColor = UIColor().getRGB(r: 209,g: 209,b: 209,alpha: 1).cgColor
        SecCollectionView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        SecCollectionView.layer.shadowOpacity = 1
        SecCollectionView.layer.shadowRadius = 1.0
        SecCollectionView.clipsToBounds = false
        SecCollectionView.layer.masksToBounds = false
        //// line
        
        let lineX = Int(SecCollectionView.frame.width) / 3
        let lineY = SecCollectionView.frame.height
        line = UIView(frame: CGRect(x: lineX + 10, y: Int(lineY - 1), width: lineX - 20, height: 1))
        line?.backgroundColor = UIColor().getRGB(r: 234,g: 74,b: 74,alpha: 1.0)
        SecCollectionView.addSubview(line!)
        
        addChilderView()
    }
 
    
    func addChilderView() {
        
        let tablevc = ProductsVC(nibName: "ProductsVC", bundle: nil)

        self.addChildViewController(tablevc)
        
        homeSectionsContainer.addSubview(tablevc.view)
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
        
            return pageIds.count
        
        } else {
        
            return sections.count
            
        }
    }
    
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 1 {
        
          selectedRow = indexPath.row
          NavCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
          NavCollectionView.reloadData()
        
        }else {
        
         selectedRow = indexPath.row
         SecCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
         let x = SecCollectionView.cellForItem(at: indexPath)?.center.x
         animateLine(x: x!)
         SecCollectionView.reloadData()
            
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
        
           return CGSize(width: self.NavCollectionView.frame.width/3 + 20, height: self.NavCollectionView.frame.height)
            
        }else{
        
            return CGSize(width: self.SecCollectionView.frame.width/3, height: self.SecCollectionView.frame.height)

        }
        
    }
    
    func animateLine(x: CGFloat)  {
        
        UIView.animate(withDuration: 0.2) {
            
            self.line?.center.x = x
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
        
         let cell = NavCollectionView.dequeueReusableCell(withReuseIdentifier: "NavCell", for: indexPath) as! NavigationCel
         cell.textToAdd = nil
         cell.textToAdd = pageIds[indexPath.row]
        
         if indexPath.row == selectedRow {
       
         cell.setUpUI(selected: true)
            
         }else if indexPath.row != selectedRow {
         
          cell.setUpUI(selected: false)
         
     
         }
            
         return cell
        
        }else{
        
            let cell = SecCollectionView.dequeueReusableCell(withReuseIdentifier: "SecCell", for: indexPath) as! SectionsCell
            cell.textToAdd = nil
            cell.textToAdd = sections[indexPath.row]
            
            if indexPath.row == selectedRow {
                
                cell.setUpUI(selected: true)
                
            }else if indexPath.row != selectedRow {
                
                cell.setUpUI(selected: false)
                
                
            }
         
            return cell
            
        }
        
    }

    
}
