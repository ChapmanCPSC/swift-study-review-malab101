//
//  ViewController.swift
//  Swiftionary
//
//  Created by Ceferino Malabed on 3/26/16.
//  Copyright © 2016 Ceferino Malabed. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    var timer = NSTimer()
    var time = 30
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    let  Topics : [String] = ["Let vs. Var", "Computed Initializers", "Computed Variables" , "Setter Observers", "Functions",  "External Parameters", "Default Parameters",  "Anonymous Functions", "Optional Chaining", "Failable Initializers", "Casting", "Class Methods", "Extensions", "Enumerations", "Error Handling", "Dictionaries", "Conditional Binding", "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts"]
    
    var idx = 0 //Change this...
    var randomNum = Int(arc4random_uniform(22))
    var correctNums  = [Int]()
    
    func countDown()
    {
        self.time -= 1
        timerLabel.text = String(time)
        
        if time < 1
        {
            time = 30
            randomNum = Int(arc4random_uniform(22))
            randomNum = randNumGen(randomNum)
            topicLabel.text = Topics[randomNum]
        }
    }
    
    func randNumGen(newNum : Int) -> Int
    {
        var num : Int
        if (correctNums.contains(newNum))
        {
            num = Int(arc4random_uniform(22))
            return randNumGen(num)
            
        }
        else{
            return newNum
        }
    }
    
    
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

    //Every time pressed, timer restarts and new word is shown, correctNums array is cleared
    //Game resets and starts right away
    @IBAction func startButton(sender: UIButton)
    {
        //randomNumber generate
        //correctNums = []
        //topicLabel.text = Topics[randomNumber]
        //timer starts
        
        timer.invalidate()
        time = 31
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.self.countDown), userInfo: nil, repeats: true)
        timer.fire()
        
        correctNums = []
        idx = 0
        topicLabel.text = Topics[randomNum]
    }
    
    //Every time is pressed, timer resets back to 30sec and "Swifttionary" is shown again.
    //Game is reset along with timer stopping
    @IBAction func stopButton(sender: UIButton)
    {
        //topicLabel.text = "Swiftionary"
        //timer changes to 00:30
        //timer invalidates
        
        time = 30
        timerLabel.text = String(time)
        timer.invalidate()
        topicLabel.text = "Swiftionary"
    }

    //Everytime pressed, timer adds 15sec to self and new word is shown
    @IBAction func nextButton(sender: UIButton)
    {
        //correctNums.append(randomNum)
        //if newnum is in correctNums array and correctNums array spaces < 24, generate newRandomNum
        //else, timer stops and topicLabel.text = "Finished!"
        //topicLabel = Topics[newRandomNum]
        
        idx+=1
        correctNums.append(randomNum)
        
        if (idx == 22){
            topicLabel.text = "Finished!"
            timer.invalidate()
            correctNums = []
        }
        else{
            randomNum = randNumGen(randomNum)
            topicLabel.text = Topics[randomNum]
            time = 31
            timer.fire()
        }
    }
    
    //Everytime pressed, new word is shown
    @IBAction func skipButton(sender: UIButton)
    {
        //generate new randomNum
        //if newnum is in correctNums array generate again
        //topicLabel = Topics[randomNum]
        
        randomNum = Int(arc4random_uniform(22))
        randomNum = randNumGen(randomNum)
        topicLabel.text = Topics[randomNum]

    }
    
}








