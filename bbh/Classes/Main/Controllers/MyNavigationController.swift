//
//  MyNavigationController.swift
//  bbh
//
//  Created by Leo on 2017/10/6.
//  Copyright © 2017年 Leo. All rights reserved.
//
// 自定义导航控制器

import UIKit

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("全局 NavigationController 启动")
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white // 头的导航栏
        if #available(iOS 10.0, *) {
            navBar.tintColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        } else {
            // Fallback on earlier versions
        }
        navBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 17)]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// 拦截 push 操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func navigationBack() {
        popViewController(animated: true)
    }

}
