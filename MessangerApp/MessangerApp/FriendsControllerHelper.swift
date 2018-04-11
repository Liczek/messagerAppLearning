//
//  FriendsControllerHelper.swift
//  MessangerApp
//
//  Created by Paweł Liczmański on 11.04.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit


class Friend: NSObject {
	var name: String?
	var imageProfileName: String?
}

class Message: NSObject {
	var text: String?
	var date: Date?
	var friend: Friend?
}

extension FriendsViewController {
	
	func setupData() {
		let mark = Friend()
		mark.name = "Mark Zuckenberg"
		mark.imageProfileName = "zuckprofile"
		
		let message = Message()
		message.friend = mark
		message.text = "Hello im Mark its nice to meet you my friend"
		message.date = Date()
		
		
		let steve = Friend()
		steve.name = "Steve Jobs"
		steve.imageProfileName = "steve_profile"
		
		let messageSteve = Message()
		messageSteve.friend = steve
		messageSteve.text = "Apple create incredible devices"
		messageSteve.date = Date()
		
		messages = [message, messageSteve]
	}
	
}
