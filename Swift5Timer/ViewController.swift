//
//  ViewController.swift
//  Swift5Timer
//
//  Created by SEIJI TANAKA on 2020/03/17.
//  Copyright © 2020 SEIJI TANAKA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopButton.isEnabled = false
        count = 0
        
        for i in 0..<5 {
            let image = UIImage(named: String(i))
            imageArray.append(image!)
        }
        
        imageView.image = imageArray[0]
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate() {
        if count < imageArray.count {
            imageView.image = imageArray[count]
        } else {
            count = -1
        }
        count = count + 1
    }

    @IBAction func start(_ sender: Any) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        startTimer()
    }
    
    @IBAction func stop(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate();
    }
}

