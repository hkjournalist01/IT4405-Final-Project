//
//  CalculatorViewController.swift
//  Conversion Calculator
//
//  Created by Yongyu Deng on 10/26/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultTextfield: UITextField!
    @IBOutlet weak var inputTextfield: UITextField!
    var converters = [Converter]()
    var currentConverter = 0
    var numberEntered = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                          Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                          Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                          Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
        inputTextfield.text? = converters[currentConverter].inputUnit
        resultTextfield.text? = converters[currentConverter].outputUnit
    }
    
    
    @IBAction func chooseConverter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.currentConverter = 0
            self.inputTextfield.text = self.converters[self.currentConverter].inputUnit
            self.resultTextfield.text = self.converters[self.currentConverter].outputUnit
            self.numberEntered = ""
        }))
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.currentConverter = 1
            self.inputTextfield.text = self.converters[self.currentConverter].inputUnit
            self.resultTextfield.text = self.converters[self.currentConverter].outputUnit
            self.numberEntered = ""
        }))
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.currentConverter = 2
            self.inputTextfield.text = self.converters[self.currentConverter].inputUnit
            self.resultTextfield.text = self.converters[self.currentConverter].outputUnit
            self.numberEntered = ""
        }))
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.currentConverter = 3
            self.inputTextfield.text = self.converters[self.currentConverter].inputUnit
            self.resultTextfield.text = self.converters[self.currentConverter].outputUnit
            self.numberEntered = ""
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func digitButtonClicked(_ sender: UIButton) {
        if let title = sender.titleLabel?.text{
            numberEntered += title
            if let number = Int(numberEntered){
                numberEntered = String(number)
            }
            compute()
        }
    }
    
    @IBAction func clearButtonClicked(_ sender: UIButton) {
        numberEntered = ""
        inputTextfield.text = ""
        resultTextfield.text = ""
        inputTextfield.text = converters[currentConverter].inputUnit
        resultTextfield.text = converters[currentConverter].outputUnit
    }
    
    
    @IBAction func signButtonClicked(_ sender: UIButton) {
        if var number = Int(numberEntered){
            number = -number
            numberEntered = String(number)
        }else if var number = Double(numberEntered){
            number = -number
            numberEntered = String(number)
        }
        compute()
    }
    
    
    
    @IBAction func decimalButtonClicked(_ sender: UIButton) {
        numberEntered += "."
        compute()
    }
    
    func compute(){
        if let input = Double(numberEntered){
            var result: Double
            switch currentConverter{
            case 0:
                result = (input - 32) * 5/9
                inputTextfield.text = numberEntered + converters[0].inputUnit
                resultTextfield.text = String(result) + converters[0].outputUnit
            case 1:
                result = (input * 9/5) + 32
                inputTextfield.text = numberEntered + converters[1].inputUnit
                resultTextfield.text = String(result) + converters[1].outputUnit
            case 2:
                result = input * 1.609344
                inputTextfield.text = numberEntered + converters[2].inputUnit
                resultTextfield.text = String(result) + converters[2].outputUnit
            case 3:
                result = input / 1.609344
                inputTextfield.text = numberEntered + converters[3].inputUnit
                resultTextfield.text = String(result) + converters[3].outputUnit
            default:
                return
            }
        }
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
