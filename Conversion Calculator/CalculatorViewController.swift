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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                          Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                          Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                          Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
        inputTextfield.text? = converters[0].inputUnit
        resultTextfield.text? = converters[0].outputUnit
    }
    
    
    @IBAction func chooseConverter(_ sender: Any) {
        let alert = UIAlertController(title: "Choose converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.inputTextfield.text = self.converters[0].inputUnit
            self.resultTextfield.text = self.converters[0].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.inputTextfield.text = self.converters[1].inputUnit
            self.resultTextfield.text = self.converters[1].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.inputTextfield.text = self.converters[2].inputUnit
            self.resultTextfield.text = self.converters[2].outputUnit
        }))
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.inputTextfield.text = self.converters[3].inputUnit
            self.resultTextfield.text = self.converters[3].outputUnit
        }))
        self.present(alert, animated: true, completion: nil)
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
