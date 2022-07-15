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
    //clear all the text from answer label as well as value label
    func clearAll()
    {
        calc = ""
        CalculatorDemo.text = ""
        CalculatorAnswer.text = ""
    }

    @IBAction func AllDelete(_ sender: Any) {
        clearAll()
    }
    //Delete last digit of number
    @IBAction func LastDigitDelete(_ sender: Any) {
        if (!calc.isEmpty)
        {
            calc.removeLast()
            CalculatorDemo.text = calc
            CalculatorAnswer.text = ""
        }
    }
    //Print number and equition
    func printString(value: String)
    {
        calc = calc + value
        CalculatorDemo.text = calc
    }
    //devide Function
    
    @IBAction func Devide(_ sender: Any) {
        printString(value: "/")
    }
    
    //Multiplication function
    @IBAction func Mul(_ sender: Any) {
        printString(value: "*")
    }
    
    //subtraction function
    @IBAction func Minus(_ sender: Any) {
        printString(value: "-")
    }
    
    //Addition function
    @IBAction func Addition(_ sender: Any) {
        printString(value: "+")
    }

//equal button check
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
    //validate the input is correct or not
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
    // count the operation symbol
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
    //result from the operation
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
    
    //finding square root
    @IBAction func squreroot(_ sender: Any) {
        let sqrtans = sqrt(Double(CalculatorDemo.text ?? "") ?? 0);
        CalculatorAnswer.text = String(sqrtans)
   }
    //finding square
    @IBAction func squre(_ sender: Any) {
       
        let sqr = (Double(CalculatorDemo.text ?? "") ?? 0) * (Double(CalculatorDemo.text ?? "") ?? 0);
        CalculatorAnswer.text = String(sqr)
        
    }
    //finding cube
    @IBAction func cube(_ sender: Any) {
        let cube = (Double(CalculatorDemo.text ?? "") ?? 0) * (Double(CalculatorDemo.text ?? "") ?? 0)
        * (Double(CalculatorDemo.text ?? "") ?? 0);
        CalculatorAnswer.text = String(cube)
    }
    
    //finding tan
    

    @IBAction func tanans(_ sender: Any) {
        let tanAns = (Double(CalculatorDemo.text ?? "") ?? 0)
        CalculatorAnswer.text = String(tan(tanAns))
    }
    
    
    //finding cos math
    @IBAction func cosresult(_ sender: Any) {
                let cosAns = (Double(CalculatorDemo.text ?? "") ?? 0)
                CalculatorAnswer.text = String(cos(cosAns))
    }
    //finding sin math
    @IBAction func sinresult(_ sender: Any) {
        let sinAns = (Double(CalculatorDemo.text ?? "") ?? 0)
              CalculatorAnswer.text = String(sin(sinAns))
    }
    
}
    
    


