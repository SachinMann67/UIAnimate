//
//  PaymentViewController.swift
//  TotalityCorp
//
//  Created by Sachin maan on 14/02/21.
//  Copyright © 2021 Sachin maan. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var circleView1: UIView!
    @IBOutlet weak var circleView2: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextSuperView: UIView!
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    @IBOutlet weak var cView: UIView!
    @IBOutlet weak var dView: UIView!
    @IBOutlet weak var eView: UIView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var fView: UIView!
    @IBOutlet weak var gView: UIView!
    @IBOutlet weak var hView: UIView!
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var readyToPlayLbl: UILabel!
    @IBOutlet weak var oswaldLbl: UILabel!
    @IBOutlet weak var zView: UIView!
    @IBOutlet weak var yView: UIView!
    @IBOutlet weak var xView: UIView!
    @IBOutlet weak var WView: UIView!
    @IBOutlet weak var vView: UIView!
    var oneFlag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        alphaZero() //setting alpha to zero of particular views
        showAnimate() // showing view with bottom to up animation
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeAnimate))
        self.view.addGestureRecognizer(tap)
    }
    
    //instatiating paymentViewcontroller
   static func instantiate() -> PaymentViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
    }
    
    //MARK: nextButton action
    /** ** nextButtonAction**  responsible to show and different views */
    @IBAction func nextButtonAction(_ sender: Any) {
        if oneFlag == false{
            oneFlag = true
            nextSuperView.isHidden = false
            afterFirstNextClick()
        }else{
            lastView.isHidden = false
            lastViewPresenting()
            nextButton.setTitle("Confirm", for: .normal)
            nextButton.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2509803922, blue: 0.2509803922, alpha: 1)
        }
        
    }
    
}

//MARK: all setup functions
extension PaymentViewController{
    
    /**  Responsible to present superView with bottom to top animation */
    func showAnimate()
    {
        self.superView.transform = CGAffineTransform(translationX: 0, y: self.superView.frame.height / 2)
        self.superView.alpha = 0.0
        self.firstView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(
            withDuration: 0.3,
            delay: 0.05,
            options: [.curveEaseInOut],
            animations: {
                self.superView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.superView.alpha = 1.0
                self.firstView.transform = CGAffineTransform(scaleX: 1, y: 1)
        },completion: {_ in
            self.presentingAllView()
        })

    }
    /**  Responsible to remove superView as child view */
    @objc func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
    
    // setting particular view's alpha zero
    func alphaZero(){
        self.firstView.alpha = 0
        self.circleView1.alpha = 0.0
        self.circleView2.alpha = 0.0
        self.secondView.alpha = 0.0
        self.thirdView.alpha = 0.0
        self.fourthView.alpha = 0.0
        self.fifthView.alpha = 0.0
        self.aView.alpha = 0.0
        self.eView.alpha = 0.0
        self.cView.alpha = 0.0
        self.dView.alpha = 0.0
        self.fView.alpha = 0.0
        self.gView.alpha = 0.0
        self.hView.alpha = 0.0
        self.balanceLabel.alpha = 0.0
        self.readyToPlayLbl.alpha = 0.0
        self.oswaldLbl.alpha = 0.0
        self.WView.alpha = 0.0
        self.vView.alpha = 0.0
        self.xView.alpha = 0.0
        

    }
    
    // responsible to show first view components with animation
    func presentingAllView(){
        self.firstView.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.circleView1.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        self.circleView2.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        self.secondView.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        self.thirdView.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        self.fourthView.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        self.fifthView.transform = CGAffineTransform(translationX: self.superView.frame.width / 2, y: 0)
        UIView.animate(
            withDuration: 0.4,
            delay: 0.05,
            options: [.curveEaseInOut],
            animations: {
                self.firstView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.firstView.alpha = 1.0
                self.circleView1.transform = CGAffineTransform(translationX: 0, y: 0)
                self.circleView1.alpha = 1.0
                self.circleView2.transform = CGAffineTransform(translationX: 0, y: 0)
                self.circleView2.alpha = 1.0
                self.secondView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.secondView.alpha = 1.0
                self.thirdView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.thirdView.alpha = 1.0
                self.fourthView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.fourthView.alpha = 1.0
                self.fifthView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.fifthView.alpha = 1.0
            })
    }
    
    // responsible to show animated view after clicking next button once
    func afterFirstNextClick(){
        self.aView.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.cView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.dView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.eView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.balanceLabel.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.fView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.gView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        self.hView.transform = CGAffineTransform(translationX: self.nextSuperView.frame.width / 2, y: 0)
        UIView.animate(
        withDuration: 0.4,
        delay: 0.05,
        options: [.curveEaseInOut],
        animations: {
            self.aView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.aView.alpha = 1.0
            self.cView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.cView.alpha = 1.0
            self.dView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.dView.alpha = 1.0
            self.eView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.eView.alpha = 1.0
            self.balanceLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.balanceLabel.alpha = 1.0
            self.fView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.fView.alpha = 1.0
            self.gView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.gView.alpha = 1.0
            self.hView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.hView.alpha = 1.0
        })
    }
    
    // responsible to show last view after second click on next button
    func lastViewPresenting(){
        self.readyToPlayLbl.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.oswaldLbl.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.xView.transform = CGAffineTransform(translationX: self.lastView.frame.width / 2, y: 0)
        self.WView.transform = CGAffineTransform(translationX: self.lastView.frame.width / 2, y: 0)
        self.vView.transform = CGAffineTransform(translationX: self.lastView.frame.width / 2, y: 0)
        
        UIView.animate(
        withDuration: 0.4,
        delay: 0.05,
        options: [.curveEaseInOut],
        animations: {
            self.readyToPlayLbl.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.readyToPlayLbl.alpha = 1.0
            self.oswaldLbl.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.oswaldLbl.alpha = 1.0
            
            self.xView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.xView.alpha = 1.0
            self.WView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.WView.alpha = 1.0
            self.vView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.vView.alpha = 1.0
            
        })
    }

}
