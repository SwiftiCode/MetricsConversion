//
//  ViewController.swift
//  MetricsConversion
//
//  Created by SwiftiCode on 20/6/20.
//  Copyright © 2020 SwiftiCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchTextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var convertFromTextField: UITextField!
    @IBOutlet weak var convertPickerView: UIPickerView!
    @IBOutlet weak var convertToLabel: UILabel!
    
    var convertList = [Int: String]()
    var convertValue: Double = 0.0
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        convertFromTextField.delegate = self
        convertPickerView.dataSource = self
        convertPickerView.delegate = self
        
        preparePickerList()
        
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        // When finish editing convert the number in the text field to number
        convertValue = Double(convertFromTextField.text!) ?? 0.0
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // When begin edditing we can clear the text field if the conversion value is 0.
        // If there is existing value, we will set the content of text field to the same
        if convertValue == 0.0 {
            convertFromTextField.text = ""
        } else {
            convertFromTextField.text = String(convertValue)
        }
    }
    
    // MARK: UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return convertList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func preparePickerList() {
        
        convertList = [0: "Feet To Meter", 1: "Meter To Feet" ]
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return convertList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        convertFromTextField.resignFirstResponder()
        
        convertFromTextField.text = ""
        
        switch row {
        case 0: let result = convertValue * 0.3048; convertFromTextField.text = String(convertValue) + " ft"; convertToLabel.text = String(result) + " m"
        case 1: let result = convertValue * 3.28084; convertFromTextField.text = String(convertValue) + " m"; convertToLabel.text = String(result) + " ft"
        default: convertToLabel.text = String(0.0)
        }
        
        
    }
    
    // MARK: IBAction
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        
        convertFromTextField.resignFirstResponder()
        
    }
    

}

