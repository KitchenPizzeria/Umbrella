//
//  ChangeCityView.swift
//  Umbrella
//
//  Created by Joseph Meyrick on 20/05/2021.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}


class ChangeCityViewController: UIViewController {
    
    @IBOutlet weak var changeCityTextField: UITextField!
    
    var delegate : ChangeCityDelegate?
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)

        self.dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
