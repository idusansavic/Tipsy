//
//  ViewController.swift
//  Tipsy
//
//  Created by Dusan Savic on 19/12/2020.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
	
	var calculatorBrain = CalculatorBrain()
	
	@IBOutlet weak var billTextField: UITextField!
	@IBOutlet weak var zeroPctButton: UIButton!
	@IBOutlet weak var tenPctButton: UIButton!
	@IBOutlet weak var twentyPctButton: UIButton!
	@IBOutlet weak var splitNumberLabel: UILabel!
	
	var tipPercentage: Double = 0.0
	var tip: String?
	var numberOfPeople: Double = 2.0
	var bill: Double = 0.0
	var perPerson: String?
	
	@IBAction func tipChanged(_ sender: UIButton) {
		billTextField.endEditing(true)
		zeroPctButton.isSelected = false
		tenPctButton.isSelected = false
		twentyPctButton.isSelected = false
		sender.isSelected = true
		
		tipPercentage = calculatorBrain.calculateTip(tipPercentage: sender.currentTitle!)
		tip = sender.currentTitle
	}
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		billTextField.endEditing(true)
		splitNumberLabel.text = String(Int(sender.value))
		numberOfPeople = sender.value
	}
	
	@IBAction func calculatePressed(_ sender: UIButton) {
		billTextField.endEditing(true)
		
		let billText = billTextField.text!
		
		if billText != "" {
			bill = Double(billText)!
			perPerson = String(format: "%.2f", (bill * (1 + tipPercentage) / numberOfPeople))
			
		} else {
			bill = 0.0
		}
		
		self.performSegue(withIdentifier: "goToResults", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToResults" {
			let destinationVC = segue.destination as! ResultsViewController
			destinationVC.numberOfPeople = Int(numberOfPeople)
			destinationVC.tipPercentage = tip
			destinationVC.perPerson = perPerson
		}
	
	}
	
}


