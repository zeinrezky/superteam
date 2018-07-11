//
//  ZeinKitLessonViewController.swift
//  SuperTeam
//
//  Created by zein rezky chandra on 10/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import UIKit

class ZeinKitLessonViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mySegmented: UISegmentedControl!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myAnimationView: UIView!
    
    var aCIImage = CIImage();
    var contrastFilter: CIFilter!;
    var brightnessFilter: CIFilter!;
    var context = CIContext();
    var outputImage = CIImage();
    var newUIImage = UIImage();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        generalInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generalInit(){
        customMySegment()
        customMyView()
        runningAnimation()
    }
    
    // Event listener to detect value changed in Switch Control
    @IBAction func switchChanged(_ sender: Any) {
        if !mySwitch.isOn {
            myView.backgroundColor = .green
            myView.layer.borderColor = UIColor.red.cgColor
            myView.layer.borderWidth = 2.0
            view.backgroundColor = .white
        } else {
            myView.backgroundColor = .red
            myView.layer.borderColor = UIColor.green.cgColor
            myView.layer.borderWidth = 2.0
            view.backgroundColor = .black
        }
    }
    
    // Custom View make it rounded in each corner
    func customMyView(){
        myView.layer.cornerRadius = 5.0
        myView.layer.masksToBounds = true
    }
    
    // Custom my segment default configuration
    func customMySegment(){
        mySegmented.selectedSegmentIndex = 0
        myLabel.text = "Desription of the first object"
    }
    
    @IBAction func segmentedChanged(_ sender: Any) {
        if mySegmented.selectedSegmentIndex == 0 {
            myLabel.text = "Description of the first object"
        } else {
            myLabel.text = "Description of the second object"
        }
    }
    
    // Custom brightness of UIImage
    func imageBrightness(imgView : UIImageView , sliderValue : CGFloat, image: UIImage){
        let aCGImage = image.cgImage
        aCIImage = CIImage(cgImage: aCGImage!)
        context = CIContext(options: nil)
        brightnessFilter = CIFilter(name: "CIColorControls")
        brightnessFilter.setValue(aCIImage, forKey: "inputImage")
        
        brightnessFilter.setValue(sliderValue, forKey: "inputBrightness")
        outputImage = brightnessFilter.outputImage!
        let cgimg = context.createCGImage(outputImage, from: outputImage.extent)
        newUIImage = UIImage(cgImage: cgimg!)
        imgView.image = newUIImage
        print("brightness")
    }
    
    // Event to catch changes in slider value
    @IBAction func sliderChanged(_ sender: Any) {
        imageBrightness(imgView: myImage, sliderValue: CGFloat(mySlider.value), image: myImage.image!)
    }
    
    
    // Playing with UIView.Animate
    func runningAnimation(){
        let anotherView = UIView()
        myAnimationView.layer.cornerRadius = myAnimationView.frame.size.width/2
        myAnimationView.layer.masksToBounds = true
        UIView.animate(withDuration: 1, animations: {
            self.myAnimationView.backgroundColor = .brown
            self.myAnimationView.frame.size.width += 10
            self.myAnimationView.frame.size.height += 10
            anotherView.frame = CGRect(x: CGFloat(arc4random_uniform(300)), y: CGFloat(arc4random_uniform(800)), width: self.myAnimationView.frame.size.width, height: self.myAnimationView.frame.size.height)
            self.view.addSubview(anotherView)
            anotherView.backgroundColor = .purple
            anotherView.frame.size.width += 10
            anotherView.frame.size.height += 10

        }) { _ in
            UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                self.myAnimationView.frame.origin.y -= 20
                anotherView.frame.origin.y -= 20
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
