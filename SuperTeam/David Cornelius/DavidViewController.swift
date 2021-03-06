//
//  DavidViewController.swift
//  SuperTeam
//
//  Created by David Cornelius on 10/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import UIKit

class DavidViewController: UIViewController {
    
    var random1:UInt32  = 0
    var random2:UInt32 = 0
    var random3:UInt32  = 0
    var random4:UInt32 = 0
    var randomColorRed:UInt32 = 0
    var randomColorGreen:UInt32 = 0
    var randomColorBlue:UInt32 = 0
    var alphaOpa:CGFloat = 0.0
    
    var a = 0
    var btnFrame : CGFloat = 0.0
    var y : CGFloat = 0
    var x : CGFloat = 0
    var z : CGFloat = 0
    
    var btn = [[Int]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.view.backgroundColor = self.getRandomColorBackground()
        //        self.view.backgroundColor = .black
        
        
        
        for n in 0...21{
            for i in 0...11 {
                var btn: UIView = UIView()
                
                if i >= 0{
                    btn = UIView(frame: CGRect(x: self.btnFrame  , y: self.z, width: view.frame.width/10, height:view.frame.width/10))
                    self.view.addSubview(btn)
                    btn.alpha = 1
                }else if n == 0 && i == 0{
                    btn = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width/10, height:view.frame.width/10))
                    self.view.addSubview(btn)
                    btn.alpha = 1
                }
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
                btn.addGestureRecognizer(panGesture)
                
                btn.backgroundColor = getRandomColor()
                self.btnFrame += btn.frame.width
                self.x = btn.frame.height
            }
            self.btnFrame = 0
            self.y = self.x
            self.z += self.y
            
        }
        
        
        
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
        let point = sender.location(in: view)
        let panGesture = sender.view
        panGesture?.center = point
        print(point)
        
        UIView.animate(withDuration: 0.6,animations: {
            sender.view!.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        },completion: { _ in
            UIView.animate(withDuration: 0.6) {
                sender.view?.transform = CGAffineTransform.identity
            }
        })
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        //        UIView.animate(withDuration: 3, animations: {
        //            self.btn.alpha = 1
        //            self.btn.frame = CGRect(x: 127, y: 346, width: 120, height: 120)
        //            self.btn.layer.cornerRadius =
        //                self.btn.frame.size.width / 2;
        //        }) { (true) in
        //            self.btn.frame = CGRect(x: 157, y: 900, width: 60, height:60)
        //            self.btn.layer.cornerRadius =
        //                self.btn.frame.size.width / 2;
        //            self.btn.alpha = 0
        //
        //            for i in 1...2{
        //                self.updateViewBall()
        //            }
        //
        //
        //            //            self.view.backgroundColor = .black
        //        }
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateViewBall() {
        
        self.view.backgroundColor = self.getRandomColorBackground()
        for _ in 1...250 {
            self.alphaOpa = CGFloat(drand48())
            
            var ball : UIView = UIView()
            ball = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            self.view.addSubview(ball)
            ball.layer.cornerRadius =
                ball.frame.size.width / 2
            ball.clipsToBounds = true
            ball.backgroundColor = getRandomColor()
            ball.center = view.center
            ball.alpha = alphaOpa
            UIView.animate(withDuration: 1+Double(Int(arc4random_uniform(3))), animations: {
                //                self.view.backgroundColor = self.getRandomColorBackground()
                self.view.backgroundColor = .black
                let sizeQ : Int = Int(arc4random_uniform(30))
                ball.frame = CGRect(x: Int(arc4random_uniform(UInt32(self.view.frame.width))), y: Int(arc4random_uniform(UInt32(self.view.frame.height))), width: sizeQ, height: sizeQ)
            }) { (true) in
                
                ball.removeFromSuperview()
            }
            
            //            UIView.animate(withDuration: Double(Int(arc4random_uniform(3)))) {
            //                ball.frame = CGRect(x: Int(arc4random_uniform(UInt32(self.view.frame.width))), y: Int(arc4random_uniform(UInt32(self.view.frame.height))), width: 30, height: 30)
            //            }
        }
    }
    
    func getRandomColor() -> UIColor {
        
        self.randomColorRed = arc4random_uniform(UInt32(128)) + 128
        self.randomColorGreen = arc4random_uniform(UInt32(128)) + 128
        
        self.randomColorBlue = arc4random_uniform(UInt32(100)) + 1
        
        print(randomColorBlue)
        
        print(randomColorRed, randomColorGreen, randomColorBlue)
        
        let newColor =  UIColor(red:CGFloat(Float(randomColorRed)/255), green: CGFloat(Float(randomColorGreen)/255), blue: CGFloat(Float(randomColorBlue)/255), alpha: 1.0)
        
        
        return newColor
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func getRandomColorBackground() -> UIColor {
        
        self.randomColorRed = arc4random_uniform(UInt32(20)) + 1
        self.randomColorGreen = arc4random_uniform(UInt32(10)) + 245
        self.randomColorBlue = arc4random_uniform(UInt32(10)) + 245
        let randomAlpha = arc4random_uniform(UInt32(10)) + 245
        
        let newColor =  UIColor(red:CGFloat(Float(randomColorRed)/255), green: CGFloat(Float(randomColorGreen)/255), blue: CGFloat(Float(randomColorBlue)/255), alpha: CGFloat(Float(randomAlpha)/255))
        
        print(newColor)
        return newColor
    }
    
    
}
