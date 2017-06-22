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
    
    var i=0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nextImage(_ sender: Any) {
        if(i < 40) {
            image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
            i += 1
        } else {
            i = 0
            image.image = UIImage(named: "frame_0_delay-0.08s.gif")
        }
    }

}

