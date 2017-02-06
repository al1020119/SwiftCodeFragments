//
//  TransitionSecondPushViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class TransitionSecondPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWill")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ddidd")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }


}
