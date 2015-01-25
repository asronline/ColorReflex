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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    let colors = ["Red", "Green","Blue","Yellow"]
    var score: Int = 0 {
        didSet { scoreLabel.text = String(score) }
    }
    
    var secondsLeft = 5
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startTimer() {
        //schedule a new timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"tick:", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func tick(timer: NSTimer) {
        println(secondsLeft)
        if secondsLeft-- == 0 {
            endGame()
        }
    }
    
    func updateColorLabel(){
        colorLabel.text = colors[Int(arc4random_uniform(4))]
    }
    
    func scorePoint() {
        score++
        secondsLeft++
    }
    
    func endGame() {
        stopTimer()
        titleLabel.text = "GAME OVER!"
        newGameButton.hidden = false
    }
    
    @IBAction func startNewGame() {
        secondsLeft = 5
        score = 0
        startTimer()
        updateColorLabel()
        titleLabel.text = "SCORE"
        newGameButton.hidden = true
    }
    
    @IBAction func colourTapped(sender: UIButton) {
        colorLabel.text == sender.titleLabel?.text! ? scorePoint() : endGame()
        updateColorLabel()
    }
}