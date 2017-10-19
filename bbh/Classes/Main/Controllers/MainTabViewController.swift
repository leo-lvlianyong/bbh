//
//  MainTabViewController.swift
//  bbh
//
//  Created by Leo on 2017/9/27.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit
import Whisper

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

        // 声明“首页”视图控制器
        let home = UINavigationController(rootViewController:viewHomeController)
        home.tabBarItem.image = UIImage(named:"main_home")
        home.view.backgroundColor = UIColor.white
        //定义tab按钮添加个badge小红点值
        // home.tabBarItem.badgeValue = ""
        
        // 声明“发布”视图控制器
        let publish = UINavigationController(rootViewController: viewPublishController)
        publish.tabBarItem.image = UIImage(named:"main_publish")
        publish.view.backgroundColor = UIColor.white

        // 声明“我”视图控制器
        let mine = UINavigationController(rootViewController:viewMineController)
        mine.tabBarItem.image = UIImage(named:"main_mine")
        mine.view.backgroundColor = UIColor.white
        
        self.viewControllers = [home,publish,mine]

 
        //默认选中的是游戏主界面视图
        self.selectedIndex = 1
 
        showWhisper2("更新10条最新数据")
        
    }
    
    // 显示头像、标题、内容等信息。
    func showWhisper(_ title: String? = "标题", _ subtitle: String = "内容" ){
        let announcement = Announcement(title: title!, subtitle: subtitle, image: UIImage(named: "imageName"))
        Whisper.show(shout: announcement, to: navigationController!, completion: {
            print("The shout was silent.")
        })
    }
    
    // 导航下显示提示信息
    func showWhisper2(_ title:String? = "您有一条消息！"){
        let message = Message(title: title!, backgroundColor: .black)
        
        // Show and hide a message after delay
        Whisper.show(whisper: message, to: navigationController!, action: .show)
        
        // Present a permanent message
        Whisper.show(whisper: message, to: navigationController!, action: .present)
        
        // Hide a message
        Whisper.hide(whisperFrom: navigationController!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
