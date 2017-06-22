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
    
    var timer = Timer()
    var i=0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextImage(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(ViewController.processImages), userInfo: nil, repeats: true)
    }
    
    func processImages() {
            if (i < 40) {
                image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
                i += 1
            } else {
                timer.invalidate()
                i = 0
                image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
                let alert = UIAlertController(title: "Alert!", message: "The Animation has FINISHED", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        timer.invalidate()
    }
    
    
}

