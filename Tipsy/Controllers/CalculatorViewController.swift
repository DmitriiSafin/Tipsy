//
//  ViewController.swift
//  Tipsy
//
//  Created by Дмитрий on 04.02.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPerson: Double = 2
    var result: Double = 0
    var tipPct = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            zeroPctButton.setTitleColor(.white, for: .selected)
        case 2:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tenPctButton.setTitleColor(.white, for: .selected)
        case 3:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            twentyPctButton.setTitleColor(.white, for: .selected)
        default:
            break
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPerson = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPerson)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if zeroPctButton.isSelected {
            tipPct = 0.0
        } else if tenPctButton.isSelected {
            tipPct = 0.1
        } else if twentyPctButton.isSelected {
            tipPct = 0.2
        }
        
        let amount = Double(billTextField.text ?? "0") ?? 0
        
        result = (amount + (amount * tipPct))/numberOfPerson
        
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segue" else { return }
        
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.amountPerPerson = String(format: "%.2f", result)
        resultsVC.tipPct = String(format: "%.0f", tipPct * 100)
        resultsVC.numberOfPerson = String(format: "%.0f", numberOfPerson)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}

