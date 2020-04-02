//
//  Concentration.swift
//  Concentration
//
//  Created by Bikkulova Alsu on 02.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import Foundation

class Concentration {

	var cards = [Card]()

	var indexOfOneAndOnlyFaceUpCard: Int?

	func chooseCard(at index: Int) {

		if !cards[index].isMatched {
			if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
				if cards[matchedIndex].identifier == cards[index].identifier {
					cards[matchedIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = nil
				// check if cards match
			} else {
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}

	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		cards.shuffle()
	}
}
