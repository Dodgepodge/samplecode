//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Dodge Ronquillo on 2/18/15.
//  Copyright (c) 2015 Dodge Ronquillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerScreen: UILabel!
    
    @IBOutlet weak var userGuess: UITextField!
    
    @IBAction func userInput(sender: AnyObject) {
        
        //Learned that I have to use Int() to convert arc4random_uniform to Int, because it becomes a UInt32.
        var randomNumber = Int(arc4random_uniform(6))
        
        var userInput = userGuess.text.toInt()
        
        if userInput != nil
        {
        
            if userInput! > 5
            {
                computerScreen.text = "Only 5 fingers in my hand! Enter a number between 0 - 5."
            }
            
            else if userInput == randomNumber
                //Looking back, it might have been safer to put Int() on randomNumber here, so it doesn't affect the variable.
                //Swift would not let me use this operator because it cannot compare Int with UInt32, hence note in line 21.
            {
                computerScreen.text = "You are correct!"
            }
                //Now I'm trying to figure out how to reset the value of randomNumber again.
                //Turns out, I don't have to figure this out. It resets on its own after the function ends. Cool.
            
            else
            {
                computerScreen.text = "Nope, it was \(randomNumber). Try again!"
            }
        }
        
        else
        {
            computerScreen.text = "Please enter a number between 0 - 5."
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

