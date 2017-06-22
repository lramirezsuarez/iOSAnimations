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

    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y - 500)
        
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y + 500)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        let originalWidth = image.frame.width
        let originalHeight = image.frame.height
        
        image.frame.size = CGSize(width: 0, height: 0)
        
        UIView.animate(withDuration: 2, animations: {
            self.image.frame.size = CGSize(width: originalWidth, height: originalHeight)
        })
    }
    
    
}

