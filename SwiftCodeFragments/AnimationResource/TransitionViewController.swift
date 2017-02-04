//
//  TransitionViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/4.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        
        imageView.image = UIImage(named: "ridding_start_button_image")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.center = CGPoint(x: 60, y: 200)
        self.view.addSubview(imageView)
    
    }

    // 需要dismiss的时候需要。
//    func dissMiss() {
//        if self.navigationController != nil {
//            self.navigationController?.popViewController(animated: true)
//        }else{
//            dismiss(animated: true, completion: nil)
//        }
//    }
    
}
