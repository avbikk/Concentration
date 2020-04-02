//
//  Card.swift
//  Concentration
//
//  Created by Bikkulova Alsu on 02.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import Foundation

struct Card {
	var isFaceUp = false
	var isMatched = false
	var identifier: Int

	static var identifierFactory = 0

	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return Card.identifierFactory
	}

	init() {
		self.identifier = Card.getUniqueIdentifier()
	}

}
