//
//  pastBuysVC.swift
//  Vruster
//
//  Created by Hiso3D on 5/5/17.
//  Copyright © 2017 Hiso3d. All rights reserved.
//

import UIKit

class pastBuysVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
	
	@IBOutlet var pastProductsCollectionView : UICollectionView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		pastProductsCollectionView?.delegate = self
		pastProductsCollectionView?.dataSource = self
		
		self.pastProductsCollectionView?.register(UINib(nibName: "pastProductCartCVCell", bundle: nil), forCellWithReuseIdentifier: "pastProductCell")
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
		return CGSize(width: 100, height: 140)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell :pastProductCartCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pastProductCell", for: indexPath) as! pastProductCartCVCell
		return cell
	}
}
