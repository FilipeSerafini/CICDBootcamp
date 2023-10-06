//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Filipe Serafini on 04/10/23.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    
    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var currentAgeTextField: UITextField!
    @IBOutlet weak var planedRetiremenAgeTextField: UITextField!
    @IBOutlet weak var averageInterestsTextField: UITextField!
    
    @IBOutlet weak var currentSavingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops!", message: "Sorry about that, an error ocurred.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default))
            self.present(alert, animated: true)
        }
        
        Analytics.trackEvent("nagidated_to_calculator")

    }
    
    @IBAction func calculateButton(_ sender: Any) {
//        Crashes.generateTestCrash()
        
        let currentAge: Int? = Int(currentAgeTextField.text!)
        let plannedRetirementAge: Int? = Int(planedRetiremenAgeTextField.text!)
        
        let properties = ["current_age" : String(currentAge!), "planned_retirement_age" : String(plannedRetirementAge!)]
        
        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)
    }
    
   
}

