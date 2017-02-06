//
//  SecondViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/1/24.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView!
    var dataArray = ["loading动画和转场动画","启动页面的动画","加载动画2","最简单的转场动画","push的转场动画"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化表格
        self.initTableView()
        JCLog("测试log")
    }

    func initTableView() -> Void {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - TABBAR_HEIGHT), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        let footerV = UIView(frame: CGRect.zero)
        self.tableView.tableFooterView = footerV
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        //下面两个属性对应subtitle
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc : UIViewController!
        if indexPath.row == 0 {
            vc = LoadingViewController()
        } else if indexPath.row == 1 {
            vc = LaunchViewController()
        } else if indexPath.row == 2 {
            vc = Loading2ViewController()
        } else if indexPath.row == 3 {
            vc = TransitionFristViewController()
        } else if indexPath.row == 4 {
            vc = TransitionFirstPushViewController()
        }
        
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
