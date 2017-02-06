//
//  AirbnbAnimationViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit
import Lottie

class AirbnbAnimationViewController: BaseViewController {

    var animationView: LAAnimationView!
    var i = 0
    var name = "PinJump.json"
    var arr = ["PinJump.json","9squares-AlBoardman.json","HamburgerArrow.json","IconTransitions.json","LottieLogo1.json","LottieLogo1_masked.json","LottieLogo2.json","MotionCorpse-Jrcanest.json","TwitterHeart.json","vcTransition1.json","vcTransition2.json","Watermelon.json",]
    override func viewDidLoad() {
        super.viewDidLoad()

//        let animationView = LAAnimationView.animationNamed("hamburger")
//        LAAnimationView *animation = [[LAAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:URL]];

        
        animationView = LAAnimationView.animationNamed(name)
        self.view.addSubview(animationView!)
        
        animationView?.play(completion: { (finished) in
            // Do Something
        })
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if i < arr.count - 1 {
            i += 1
        } else {
            i = 0
        }
        
        name = arr[i]
        
        animationView.removeFromSuperview()
        animationView = LAAnimationView.animationNamed(name)
        self.view.addSubview(animationView!)
        
        animationView?.play(completion: { (finished) in
            // Do Something
        })
    }
    

}
