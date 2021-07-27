//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UIButton!
    @IBOutlet weak var bottomLabel: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain=QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
            
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        scoreLabel.text="Score: \(quizBrain.getScore())"
        topLabel.backgroundColor=UIColor.clear
        bottomLabel.backgroundColor=UIColor.clear
        progressBar.progress=quizBrain.getProgress()
    }
    
}

