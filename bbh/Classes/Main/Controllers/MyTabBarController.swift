//
//  MyTabBarController.swift
//  bbh
//
//  Created by Leo on 2017/10/6.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        // tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        tabBar.tintColor = UIColor.black
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "main_home", selectedImage: "main_home")
        
        addChildViewController(childController: HomeViewController(), title: "", imageName: "main_publish", selectedImage: "main_publish")
        
        addChildViewController(childController: MineViewController(), title: "我的", imageName: "main_mine", selectedImage: "main_mine")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImage: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        childController.title = title
        let navC = MyNavigationController(rootViewController: childController)
        navC.navigationItem.title = title
        addChildViewController(navC)
    }
}
