//
//  ViewController.swift
//  IsItPrime
//
//  Created by Dodge Ronquillo on 4/24/15.
//  Copyright (c) 2015 Dodge Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var number: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func checkPrime(sender: AnyObject) {
        
        var num = number.text.toInt()
        
        var isPrime = true
        
        if num != nil
        {
        
            var unwrappedNum = num!
            
            if unwrappedNum == 1 || unwrappedNum == 0
            {
                isPrime = false
            }
        
            if unwrappedNum != 2 && unwrappedNum != 1
            {
                for var i = 2; i < unwrappedNum; ++i
                {
                    if unwrappedNum % i == 0
                    {
                        isPrime = false
                    }
                }
            }
        
            if isPrime == false
            {
            
                resultLabel.text = "\(num!) is not a prime number."
            }
        
            else
            {
                resultLabel.text = "\(unwrappedNum) is a prime number."
            }
        }
        
        else
        
        {
            resultLabel.text = "Please enter a number in the box."
        }
        
    }

}

