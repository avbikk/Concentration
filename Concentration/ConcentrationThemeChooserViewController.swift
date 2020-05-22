//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by 17867124 on 23.04.2020.
//  Copyright © 2020 Bikkulova Alsu. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

	let themes = [
		"Sports": "🇫🇷🎂🛍🇨🇦🇧🇷🐉🎅🇲🇽🦠🕯🇨🇳🎥🍂💪🎓🔥🎃🕎💕🕉🇺🇸🎊🏊🏳️‍🌈👑🌱🏈🦃🏡⚽🌎",
		"Animals": "🐩🐺🦊🦝🐱🐈🦁🐯🐅🐆🐴🐰🐎🦄🦓🦌🐮🐂🐃🐄🐷🐖🐗🐽🐏🐑🐐🐪🐫🦙🦒",
		"Faces": "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗"

	]

	// MARK: - Navigation


	@IBAction func themeChooser(_ sender: UIButton) {
		performSegue(withIdentifier: "Choose Theme", sender: sender)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Choose Theme" {
			if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
				if let cvc = segue.destination as? ConcentrationViewController {
					cvc.theme = theme
				}
			}
		}
	}

}
