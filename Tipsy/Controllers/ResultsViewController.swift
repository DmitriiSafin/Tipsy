//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Дмитрий on 04.02.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amountPerPerson: String!
    var numberOfPerson: String!
    var tipPct: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = amountPerPerson
        settingsLabel.text = "Split between \(String(numberOfPerson)) people, with \(String(tipPct))% tip."
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
