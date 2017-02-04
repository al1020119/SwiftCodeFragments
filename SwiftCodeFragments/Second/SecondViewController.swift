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
    var dataArray = ["loading动画"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化表格
        self.initTableView()
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
            // 动画1
            vc = LoadingViewController()
        }
        
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
