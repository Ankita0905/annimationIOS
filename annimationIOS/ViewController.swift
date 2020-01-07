//
//  ViewController.swift
//  annimationIOS
//
//  Created by Ankita Jain on 2020-01-07.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageVie: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    
    var timer=Timer()
    var counter=0
    var isAnimated=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func fadeIn(_ sender: Any) {
        imageVie.alpha=0
        UIView.animate(withDuration: 5) {
            self.imageVie.alpha=1
        }
    }
    
    @IBAction func slideIn(_ sender: UIButton) {
        imageVie.center=CGPoint(x: imageVie.center.x-1000, y: imageVie.center.y)
               UIView.animate(withDuration: 2) {
                   self.imageVie.center=CGPoint(x: self.imageVie.center.x+1000, y: self.imageVie.center.y)
               }
           }
    
    @IBAction func grow(_ sender: UIButton) {
        let width=imageVie.frame.size.width
        let height=imageVie.frame.size.height
        
        let x=imageVie.frame.origin.x
        let y=imageVie.frame.origin.y
        
        imageVie.frame=CGRect(x: x, y: y, width: 0, height: 0)
        UIView.animate(withDuration: 2) {
            self.imageVie.frame=CGRect(x: x, y: y, width: width, height: height)
        }
    }
   
    @IBAction func play(_ sender: UIButton) {
        if isAnimated
               {
                timer.invalidate()
                playBtn.setTitle("Play", for: [])
                isAnimated=false
               }
               else
               {
                    timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
                playBtn.setTitle("Stop", for: [])
                isAnimated=true
               }
    }
    
   @objc func animate()
    {
       
        imageVie.image=UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        counter+=1
        if counter==6
        {
            counter=0
        }
    }
}

