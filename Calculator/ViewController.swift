//
//  ViewController.swift
//  Calculator
//
//  Created by A00240755 on 2022-07-06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculatorDemo: UILabel!
    @IBOutlet weak var CalculatorAnswer: UILabel!
    
    var calc:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    func clearAll()
    {
        calc = ""
        CalculatorDemo.text = ""
        CalculatorAnswer.text = ""
    }

    @IBAction func AllDelete(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func LastDigitDelete(_ sender: Any) {
        if (!calc.isEmpty)
        {
            calc.removeLast()
            CalculatorDemo.text = calc
            CalculatorAnswer.text = ""
        }
    }
    func printString(value: String)
    {
        calc = calc + value
        CalculatorDemo.text = calc
    }
    
    @IBAction func Modulo(_ sender: Any) {
        printString(value: "%")
    }
    
    
    @IBAction func Devide(_ sender: Any) {
        printString(value: "/")
    }
    
    @IBAction func Mul(_ sender: Any) {
        printString(value: "*")
    }
    
    
    @IBAction func Minus(_ sender: Any) {
        printString(value: "-")
    }
    
    
    @IBAction func Addition(_ sender: Any) {
        printString(value: "+")
    }
    
    
    @IBAction func Equal(_ sender: Any) {
        if(validInput())
        {
        let answser = NSExpression(format: calc)
        let result = answser.expressionValue(with: nil, context: nil) as! Double
        let resultAnser = formatResult(result: result)
        CalculatorAnswer.text = resultAnser
        }else{
            let alert = UIAlertController (title: "Wrong Input", message: "Unable to calculate", preferredStyle: .alert)
            alert.addAction(UIAlertAction (title: "Ok", style: .default))
            self.present(alert,animated: true ,completion: nil)
        }
        }
    func validInput() -> Bool{
        var num = 0
        var numIndex = [Int]()
        for char in calc
        {
            if(charactorCount(char: char))
            {
                numIndex.append(num)
            }
            num += 1
        }
        var previous: Int = -1
        
        for index in numIndex {
            if (index == 0)
            {
                return false
            }
            if (index == calc.count - 1)
            {
                return false
            }
            if (previous != -1)
            {
                if (index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    func charactorCount (char: Character) ->Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f",result)
        }else{
            return String(format: "%.2f",result)
        }
    }
    
    
    @IBAction func SevenTap(_ sender: Any) {
        printString(value: "7")
    }
    
    
    @IBAction func EightTap(_ sender: Any) {
        printString(value: "8")
    }
    
    
    @IBAction func NineTap(_ sender: Any) {
        printString(value: "9")
    }
    
    
    @IBAction func FourTap(_ sender: Any) {
        printString(value: "4")
    }
    
    
    @IBAction func FiveTap(_ sender: Any) {
        printString(value: "5")
    }
    
    
    @IBAction func SixTap(_ sender: Any) {
        printString(value: "6")
    }
    
    
    @IBAction func OneTap(_ sender: Any) {
        printString(value: "1")
    }
    
    
    @IBAction func TwoTap(_ sender: Any) {
        printString(value: "2")
    }
    
    @IBAction func ThreeTap(_ sender: Any) {
        printString(value: "3")
    }
    
    @IBAction func DotTap(_ sender: Any) {
        printString(value: ".")
    }
    
    @IBAction func ZeroTap(_ sender: Any) {
        printString(value: "0")
    }
    
    
    
}

