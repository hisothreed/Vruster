//
//  cartVC.swift
//  Vruster
//
//  Created by Hiso3D on 4/29/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class cartVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

		@IBOutlet var cartProductsCollectionView : UICollectionView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
			cartProductsCollectionView?.delegate = self
			cartProductsCollectionView?.dataSource = self
			self.cartProductsCollectionView?.register(UINib(nibName: "productCartCVCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 70, height: 70)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell :productCartCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! productCartCVCell
		cell.backgroundColor = .red
		return cell
	}
}
