//
//  ViewController.swift
//  DeckShuffler
//
//  Created by Dodge Ronquillo on 3/4/15.
//  Copyright (c) 2015 Dodge Ronquillo. All rights reserved.
//

import UIKit

//Chose to represent the deck by using an array.
//Later on I can create a dict that will translate the array values into words that I can display on screen.
// March 8 update - no more array, just fixed the keys to be able to display proper definitions



class ViewController: UIViewController
{
    
    var deck = [String]()
    
    @IBOutlet weak var cardsDrawnInHand: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shuffleButton(sender: AnyObject) {
        let suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
        
        
        //Because of this error, I'm not sure where to put this. Should I make a new file and do it there? How does this work? I'm confused.
        for s in suits
        {
            deck.append("Ace of \(s)")
            //for (var i = 2; i < 11; ++i)
            for i in 2..<11
            {
                deck.append("\(i) of \(s)")
            }
            deck.append("Jack of \(s)")
            deck.append("Queen of \(s)")
            deck.append("King of \(s)")
            
        }
        
    }
    
    
    @IBAction func drawButton(sender: AnyObject)
    {
        
    var cardsDrawn = [String]()
    
        //I'm trying to write a for loop that will run randomNumber each time, so that I can hit the Shuffle button once and let it choose 3 cards from the deck. For some reason, it makes the value of i super huge, and the loop never ends.
        //For some reason if var randomNumber is declared inside the for loop, i becomes 0 ALWAYS. If it's declared outside, it becomes the obscenely huge value. I wish I knew the answer why
        //for var i = 1; i <= 3; ++i
        for _ in 1...3
        {
            var randomNumber = Int(arc4random_uniform(UInt32(deck.count)))
            //03-27-2014
            // I need to cast deck.count within a UInt32() to make it convertible to an int! What
            //Ok, so now I am able to reduce the deck count. Unforunately, the values aren't stored anywhere outside the button, so I cannot keep the piles saved. 
            // I'm thinking, I can probably create a 'deck' object, and make this button into a 'shuffle' button.
            print(randomNumber)
            //Another bug is randomNumber being less than the number allowed
            
            cardsDrawn.append(deck[randomNumber])
            deck.removeAtIndex(randomNumber)
        }
        //Another bug is preventing the same card from being drawn in the first click. Right now RandomNumber can be the same. How do I check this?

        
        var cardOne = cardsDrawn[0]
        var cardTwo = cardsDrawn[1]
        var cardThree = cardsDrawn[2]
        
        cardsDrawnInHand.text = "\(cardOne) \n \(cardTwo) \n \(cardThree)"

        print("Current deck is:")
        print(deck.count)
        print(deck)
        
        
        print("Cards drawn are:")
        print(cardsDrawn.count)
        print(cardsDrawn)
        
    }

}

