//
//  WelcomeViewController.swift
//  Vruster
//
//  Created by Hiso3d on 2/4/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var PagingCollectionView: UICollectionView!    
    
  
    @IBOutlet var flowScroll: UIScrollView!
    
    var textArray : [String]?
    var images : [UIImage]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setUpUI()
        
        textArray = ["We handle shopping and deliever everything to you home","It's never been that Easy"]
        images = [UIImage(named: "welcom")!,UIImage(named: "welcom2")!]
    
    }
    
    
    func setUpUI()  {

        
        ///// collectionView layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        PagingCollectionView.isPagingEnabled = true
        PagingCollectionView.showsHorizontalScrollIndicator = false
        PagingCollectionView.collectionViewLayout = layout
        PagingCollectionView.delegate = self
        PagingCollectionView.dataSource = self
        
        ///get it
        
        let flowView = Bundle.main.loadNibNamed("FlowView", owner: self, options: nil)?[0] as? UIView
        let secondFlowView  = Bundle.main.loadNibNamed("SecondFlowView", owner: self, options: nil)?[0] as? UIView
        
        /// place it
        
        flowView?.frame = CGRect(x: 0, y: 0, width: flowScroll.frame.width, height: self.flowScroll.frame.height)
        secondFlowView?.frame = CGRect(x: self.view.frame.width , y: 0, width: flowScroll.frame.width, height: flowScroll.frame.height)

        flowScroll.contentSize.width = self.view.frame.width * 2
        flowScroll.contentMode = .right
        
        
        /// add it
        flowScroll.addSubview(flowView!)
        flowScroll.addSubview(secondFlowView!)
        
        flowScroll.delegate = self
        flowScroll.isPagingEnabled = true
        flowScroll.tag = 1
      

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.PagingCollectionView.frame.width, height: self.PagingCollectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = PagingCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PagingViewCell
        cell.Text.text = textArray?[indexPath.row]
        cell.PageImage.image = images?[indexPath.row]
        cell.frame.size.width = self.view.frame.width
        return cell
    
    }
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 1  {
    
            if scrollView.contentOffset.x == self.view.frame.width {
    
                let indexPath = NSIndexPath(row: 1, section: 0)
                
                PagingCollectionView.scrollToItem(at: indexPath as IndexPath, at: .right, animated: true)
                
            }else {
                
                let indexPath = NSIndexPath(row: 0, section: 0)
                
                PagingCollectionView.scrollToItem(at: indexPath as IndexPath, at: .right, animated: true)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard PagingCollectionView.visibleCells.count == 1 else {
            return
        }
        
        let cell = PagingCollectionView.visibleCells[0]
        
        let indexPath = PagingCollectionView.indexPath(for: cell)
        
        let newOffsetX = Int(flowScroll.frame.width)*(indexPath?.row)!
        
        let newOffset = CGPoint(x: newOffsetX, y: 0)
        
        flowScroll.setContentOffset(newOffset , animated: true)
        

    }
    
    

    
}
