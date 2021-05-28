//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Dusan Savic on 19/12/2020.
//  Copyright © 2021 Dusan Savic. All rights reserved.
//

import Foundation

struct CalculatorBrain {
	
	func calculateTip(tipPercentage: String) -> Double {
		Double(String(tipPercentage.dropLast()))! / 100
	}
	
}
