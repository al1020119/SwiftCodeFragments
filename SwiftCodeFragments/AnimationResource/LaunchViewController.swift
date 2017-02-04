//
//  LaunchViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/4.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class LaunchViewController: BaseViewController {
    var launchView: LaunchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        launchView = LaunchView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), launchImage: UIImage.init(named: "Launch_image"))
        view.addSubview(launchView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.launchView.starAnimation()
        }
    }
    
    internal override var prefersStatusBarHidden : Bool {
        return true
    }

}
