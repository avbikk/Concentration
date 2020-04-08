//
//  Card.swift
//  Concentration
//
//  Created by Bikkulova Alsu on 02.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import Foundation

struct Card: Hashable {
	var isFaceUp = false
	var isMatched = false
	private var identifier: Int

	private static var identifierFactory = 0

	private static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return Card.identifierFactory
	}

	init() {
		self.identifier = Card.getUniqueIdentifier()
	}

	func hash(into hasher: inout Hasher) {
	   hasher.combine(identifier)
	}

	static func ==(lth: Card, rhs: Card) -> Bool {
		return lth.identifier == rhs.identifier
	}
}
