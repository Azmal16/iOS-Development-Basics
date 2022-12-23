//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    //var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //progressBar.progress = 1.0
        timer.invalidate()
        //hardness is optional here. we have to unwrap it before using it
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes [hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        //updateTimer fn gets called every second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector (updateTimer), userInfo:nil,
        repeats: true)
        
        
    }
    
    
    
    @objc func updateTimer () {
        if secondsPassed <= totalTime {
           // print("\(secondsPassed) seconds.")
            
            progressBar.progress = Float (secondsPassed) / Float (totalTime)
            print(Float (secondsPassed) / Float (totalTime))
            print (Float (secondsPassed / totalTime))
            secondsPassed += 1
        }
        
        else {
            timer.invalidate()
            //changing the text of titleLabel
            titleLabel.text = "Done!"
        }
    }
}
