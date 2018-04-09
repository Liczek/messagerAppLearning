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
		navigationItem.title = "Recent"
		collectionView?.backgroundColor = UIColor.white
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
	
	let dividerLineView: UIView = {
		let lineView = UIView()
		lineView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		return lineView
	}()
	
	override func setupCell() {
		
		self.addSubview(profileImageView)
		self.addSubview(dividerLineView)
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		dividerLineView.translatesAutoresizingMaskIntoConstraints = false
		profileImageView.layer.masksToBounds = true
		profileImageView.layer.cornerRadius = 34

		addConstraintsWithVisualFormat(format: "H:|-12-[v0(68)]", views: profileImageView)
		addConstraintsWithVisualFormat(format: "V:|-12-[v0(68)]", views: profileImageView)
		
		addConstraintsWithVisualFormat(format: "H:|-86-[v0]|", views: dividerLineView)
		addConstraintsWithVisualFormat(format: "V:[v0(1)]|", views: dividerLineView)

	}
}

extension UIView {
	func addConstraintsWithVisualFormat(format: String, views: UIView...) {
		
		var viewsDictionary = [String: UIView]()
		for (index, view) in views.enumerated() {
			let key = "v\(index)"
			viewsDictionary[key] = view
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
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












