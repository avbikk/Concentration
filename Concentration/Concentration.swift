//
//  Concentration.swift
//  Concentration
//
//  Created by Bikkulova Alsu on 02.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import Foundation

class Concentration {

	private(set) var cards = [Card]()

	private var indexOfOneAndOnlyFaceUpCard: Int? {
		get {
			return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
		}

		set {
			for index in cards.indices {
				cards[index].isFaceUp = (index == newValue)
			}
		}
	}

	func chooseCard(at index: Int) {
		assert(cards.indices.contains(index), "Concentration.chooseCard(at index: \(index) not in the cards")
		if !cards[index].isMatched {
			if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
				if cards[matchedIndex] == cards[index] {
					cards[matchedIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
			} else {
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}

	init(numberOfPairsOfCards: Int) {
		assert(numberOfPairsOfCards>0, "Concentration.init(numberOfPairsOfCards: \(String(describing: index)) shouldn't be less than 0")

		for _ in 0..<numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		cards.shuffle()
	}
}

extension Collection {
	var oneAndOnly: Element? {
		return count == 1 ? first : nil
	}
}
