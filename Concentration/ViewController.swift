//
//  ViewController.swift
//  Concentration
//
//  Created by Bikkulova Alsu on 02.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

	private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)

	var numberOfPairsOfCards: Int {
		return (cardButtons.count + 1) / 2
	}
	private(set) var flipCount = 0 {
		didSet {
			updateFlipCountLabel()
		}
	}

	private func updateFlipCountLabel() {
		let attributes: [ NSAttributedString.Key: Any] = [
			.strokeWidth : 5.0,
			.strokeColor : UIColor.orange
		]

		let attributedString = NSAttributedString(string: "Flips: " + String(flipCount), attributes: attributes)
		flipCountLabel.attributedText = attributedString
	}

	@IBOutlet private weak var flipCountLabel: UILabel! {
		didSet {
			updateFlipCountLabel()
		}
	}

	@IBOutlet private var cardButtons: [UIButton]!


	@IBAction func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardNumber = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel()
		} else {
			print("Chosen card was not in cardButton")
		}
	}

	private func updateViewFromModel() {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emoji(for: card), for: .normal)
				button.backgroundColor = .white
			} else {
				button.setTitle("", for: .normal)
				button.backgroundColor = card.isMatched ? .clear : .orange
			}
		}
	}

	private var emojiChoices = "👿🕰💎⚙️🚗⚓️🦐🐍🦋🧑🏼‍🦯🇻🇦"
	private var emoji = [Card: String]()

	private func emoji(for card: Card) -> String {
		if emoji[card] == nil, emojiChoices.count > 0 {
			let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
			emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
		}
		return emoji[card] ?? "?"
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}
}

extension Int {
	var arc4random: Int {
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else if self < 0 {
			return -Int(arc4random_uniform(UInt32(self)))
		} else {
			return 0
		}
	}
}
