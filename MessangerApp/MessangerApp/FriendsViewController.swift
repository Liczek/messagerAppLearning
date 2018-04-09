//
//  ViewController.swift
//  MessangerApp
//
//  Created by Paweł Liczmański on 09.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import UIKit

class FriendsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

	private let cellID = "cellID"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView?.backgroundColor = UIColor.green
		collectionView?.alwaysBounceVertical = true
		
		collectionView?.register(FriendCell.self , forCellWithReuseIdentifier: cellID)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 100)
	}
	

}

class FriendCell: BaseCell {
	
	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "zuckprofile")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	override func setupCell() {
		self.backgroundColor = UIColor.red
		
		self.addSubview(profileImageView)
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		profileImageView.layer.masksToBounds = true
		profileImageView.layer.cornerRadius = 34
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))

	}
}

class BaseCell: UICollectionViewCell {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCell() {
		self.backgroundColor = UIColor.red
	}
}












