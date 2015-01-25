//
//  ViewController.swift
//  ColorReflex
//
//  Created by Ammaar Reshi on 25/01/2015.
//  Copyright (c) 2015 Ammaar Reshi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var colorLabel: UILabel!
    
    let colors = ["red", "green","blue","yellow"]
    var score = 0;
    
    var secondsLeft: Int = 3
    var timer: NSTimer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.startTimer()
        updateColorLabel()
        
    }
    
    func startTimer() {
        //schedule a new timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"tick:", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        resetScore()
        
    }
    
    func tick(timer: NSTimer) {
        println(secondsLeft)
        secondsLeft--
        if secondsLeft == 0 {
            self.stopTimer()
        }
    }
    
    
    func updateColorLabel(){
        
        colorLabel.text = colors[Int(arc4random_uniform(4))]
    }
    
    func scorePoint(){
        score++
        secondsLeft++
        scoreLabel.text = String(score)
    }
    
    func resetScore(){
        
        score = 0
        scoreLabel.text = String(score)
    }
    
    
    @IBAction func colourTapped(sender: UIButton) {
        if (colorLabel.text == "green" && sender == greenButton) ||
            (colorLabel.text == "red" && sender == redButton) ||
            (colorLabel.text == "blue" && sender == blueButton) ||
            (colorLabel.text == "yellow" && sender == yellowButton) {
                scorePoint()
        } else {
            resetScore()
        }
        
        updateColorLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

