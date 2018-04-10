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
	
	let containerView: UIView = {
		let containerView = UIView()
		containerView.backgroundColor = UIColor.white
		return containerView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Mark Zuckenberg"
		label.font = UIFont.boldSystemFont(ofSize: 18)
		return label
	}()
	
	let messageLabel: UILabel = {
		let label = UILabel()
		label.text = "Jakaś treść wiadomości na tyle długa, żeby nie zmieściła się w jednej linijce"
		label.font = UIFont.systemFont(ofSize: 14)
		return label
	}()
	
	let timeLabel: UILabel = {
	let label = UILabel()
		label.text = "12:06 pm"
		label.font = UIFont.systemFont(ofSize: 14)
		label.textAlignment = .right
	return label
	}()
	
	let hasReadImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "zuckprofile")
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 10
		return imageView
	}()
	
	private func setupContainerView() {
		containerView.addSubview(nameLabel)
		containerView.addSubview(messageLabel)
		containerView.addSubview(timeLabel)
		containerView.addSubview(hasReadImageView)
		
		addConstraintsWithVisualFormat(format: "H:|[v0][v1(80)]-8-|", views: nameLabel, timeLabel)
		addConstraintsWithVisualFormat(format: "V:|[v0][v1(24)]|", views: nameLabel, messageLabel)
		addConstraintsWithVisualFormat(format: "H:|[v0]-8-[v1(20)]-8-|", views: messageLabel, hasReadImageView)
//		addConstraintsWithVisualFormat(format: "V:|[v0(24)]", views: timeLabel)
		addConstraint(NSLayoutConstraint(item: timeLabel, attribute: .centerY, relatedBy: .equal, toItem: nameLabel, attribute: .centerY, multiplier: 1, constant: 0))
		addConstraintsWithVisualFormat(format: "V:[v0(20)]|", views: hasReadImageView)
	}
	
	override func setupCell() {
		
		self.addSubview(profileImageView)
		self.addSubview(dividerLineView)
		self.addSubview(containerView)
		setupContainerView()
		profileImageView.layer.masksToBounds = true
		profileImageView.layer.cornerRadius = 34

		addConstraintsWithVisualFormat(format: "H:|-12-[v0(68)]-8-[v1]|", views: profileImageView, containerView)
		addConstraintsWithVisualFormat(format: "V:[v0(68)]", views: profileImageView)
		addConstraint(NSLayoutConstraint(item: profileImageView	, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

		
		addConstraintsWithVisualFormat(format: "H:|-86-[v0]|", views: dividerLineView)
		addConstraintsWithVisualFormat(format: "V:[v0(1)]|", views: dividerLineView)
		
		addConstraintsWithVisualFormat(format: "V:[v0(68)]", views: containerView)
		addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

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












