//  
//  HomeVC.swift
//  Vruster
//
//  Created by Hiso3D on 3/9/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {

    @IBOutlet weak var  NavCollectionView: UICollectionView!
    @IBOutlet weak var  SecCollectionView: UICollectionView!
    @IBOutlet weak var homeSectionsContainer : UIView!
    var pageIds : [String] = ["Shopping Cart","Shopping","Scan","Past Orders"]
    var sections : [String] = ["Best selling","Best Price","Stores","Scan"]
    var selectedRow : Int?
    var line : UIView?
    var sideMenuObserver : Bool = false
    var sideView : UIView!
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
        NavCollectionView.contentInset.left = 0
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
        
        
        let gRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(handleSwip))
        gRecognizer.edges = .left
        gRecognizer.delegate = self
        gRecognizer.minimumNumberOfTouches = 1
        gRecognizer.maximumNumberOfTouches = 2
        view.addGestureRecognizer(gRecognizer)
        
        
    }
    func handleSwip(gesture : UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .ended {
         let sideView = loadNewView(viewName: "sideView")
         animateSideView(view: sideView,toggle: true)
         self.sideMenuObserver = true
        }
    }
    
    func loadNewView(viewName : String) -> UIView {
        let view = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)?[0] as! UIView
        view.frame = CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width/1.5, height: self.view.frame.height)
        let observerView: UIView = {
            let v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            v.alpha = 0.4
            v.backgroundColor = .black
					v.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleDismiss)))
					return v
        }()
        self.sideView = view
        self.view.addSubview(observerView)
        self.view.addSubview(view)
        return view
    }
    func handleDismiss(touch: UITapGestureRecognizer) {
			animateSideView(view: self.sideView,toggle: false)
    }
    func animateSideView(view: UIView,toggle: Bool)  {
			if toggle {
			 let sideView = view
			 self.view.subviews[self.view.subviews.count-2].isHidden = true
			 UIView.animate(withDuration: 0.5) {
					 sideView.frame.origin.x = self.view.frame.origin.x
					 self.view.subviews[self.view.subviews.count-2].isHidden = false
			 }
			}else{
			 let sideView = view
			 UIView.animate(withDuration: 0.5, animations: {
					sideView.frame.origin.x = -self.view.frame.width
					self.view.subviews[self.view.subviews.count-2].isHidden = true
			 }, completion: { (true) in
					self.view.subviews.last?.removeFromSuperview()
					self.view.subviews.last?.removeFromSuperview()
			 })
		 }
			
    }
    func addChilderView() {
			homeSectionsContainer.subviews.last?.removeFromSuperview()
			if selectedRow == 0 {
				let cartViewC = cartVC(nibName: "cartVC", bundle: nil)
				SecCollectionView.isHidden = true
				self.addChildViewController(cartViewC)
				homeSectionsContainer.addSubview(cartViewC.view)
			}
			if selectedRow == 1 {
				let productsVC = ProductsVC(nibName: "ProductsVC", bundle: nil)
				SecCollectionView.isHidden = false
				self.addChildViewController(productsVC)
				homeSectionsContainer.addSubview(productsVC.view)
			}
			if selectedRow == 3 {
				let pastBuys = pastBuysVC(nibName: "pastBuysVC", bundle: nil)
				SecCollectionView.isHidden = true
				self.addChildViewController(pastBuys)
				homeSectionsContainer.addSubview(pastBuys.view)
			}
			
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
					addChilderView()
          NavCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          NavCollectionView.reloadData()
        }else {
         selectedRow = indexPath.row
         SecCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
