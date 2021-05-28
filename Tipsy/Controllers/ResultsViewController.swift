//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dusan Savic on 19/12/2020.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var settingsLabel: UILabel!
	
	var numberOfPeople: Int?
	var tipPercentage: String?
	var perPerson: String?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		totalLabel.text = perPerson ?? "0.0"
		settingsLabel.text = ("Split between \(numberOfPeople!) people, with \(tipPercentage!) tip.")

    }
    
	@IBAction func recalculatePressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
  
}



