//
//  ViewController.swift
//  Animations
//
//  Created by Luis Ramirez on 6/22/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var timer = Timer()
    var i=0
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            button.setTitle("Start animation", for: [])
            isAnimating = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(ViewController.processImages), userInfo: nil, repeats: true)
            button.setTitle("Stop animation", for: [])
            isAnimating = true
        }
    }
    
    func processImages() {
        image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
        i += 1
        if i == 39 {
            i = 0
            image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
        }
    }
    
    
    
}

