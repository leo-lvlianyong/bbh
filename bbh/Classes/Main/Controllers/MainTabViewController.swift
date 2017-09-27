//
//  MainTabViewController.swift
//  bbh
//
//  Created by Leo on 2017/9/27.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.black
        
        //一共包含了三个视图
        let viewHomeController = HomeViewController()
        viewHomeController.title = "首页"
        let viewPublishController = HomeViewController()
        viewPublishController.title = "发布"
        let viewMineController = MineViewController()
        viewMineController.title = "我"

        // 声明首页视图控制器
        let home = UINavigationController(rootViewController:viewHomeController)
        home.tabBarItem.image = UIImage(named:"main_home")
        home.view.backgroundColor = UIColor.white
        //定义tab按钮添加个badge小红点值
        // home.tabBarItem.badgeValue = ""
        
        // 声明发布视图控制器
        let publish = UINavigationController(rootViewController: viewPublishController)
        publish.tabBarItem.image = UIImage(named:"main_ publish")
        publish.view.backgroundColor = UIColor.white

        // 声明我视图控制器
        let mine = UINavigationController(rootViewController:viewMineController)
        mine.tabBarItem.image = UIImage(named:"main_mine")
        mine.view.backgroundColor = UIColor.white
        
        self.viewControllers = [home,publish,mine]

        //默认选中的是游戏主界面视图
        self.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
