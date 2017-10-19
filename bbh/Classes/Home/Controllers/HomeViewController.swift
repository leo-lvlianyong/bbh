//
//  Home.swift
//  bbh-Swift
//
//  Created by Leo on 2017/9/27.
//  Copyright © 2017年 Leo. All rights reserved.
//
// 1.首页 控制器

import UIKit
import Whisper

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 拓展-设置导航栏颜色
        //navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"
        navigationController?.navigationBar.barTintColor = UIColor.black
        showWhisper2("更新5记录")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景设置为：拓展颜色
        view.backgroundColor = UIColor.globalBackgroundColor()
        
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        
        // 自定义导航栏
        navigationItem.titleView = homeNavigationBar
        
        // 如果您的视图控制器实现管理它自己的滚动视图inset调整，则将此属性设置为false
        automaticallyAdjustsScrollViewInsets = false
        
        /// 网络获取标题数据
        NetworkTool.loadHomeTitlesData(fromViewController: String(describing: HomeViewController.self)) { (topTitles, homeTopicVCs) in
            // 将所有子控制器添加到父控制器中
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
                print(childVc)
            }
            //self.setupUI()
            
            //self.pageView.titles = topTitles
            //self.pageView.childVcs = self.childViewControllers as? [TopicViewController]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        return pageView
    }()
    
    // 自定义导航栏搜索栏
    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar()
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension HomeViewController {

    fileprivate func setupUI() {

       view.addSubview(pageView)

       pageView.snp.makeConstraints { (make) in
           make.left.bottom.right.equalTo(view)
          make.top.equalTo(view).offset(kNavBarHeight)
      }

        
    
//    NotificationCenter.default.addObserver(self, selector: #selector(homeTitleAddButtonClicked(notification:)), name: NSNotification.Name(rawValue: "homeTitleAddButtonClicked"), object: nil)
    }

    /// 点击了加号按钮
//    @objc func homeTitleAddButtonClicked(notification: Notification) {
//        let titles = notification.object as! [TopicTitle]
//        let homeAddCategoryVC = HomeAddCategoryController.loadStoryboard()
//        homeAddCategoryVC.homeTitles = titles
//        homeAddCategoryVC.modalSize = (width: .full, height: .custom(size: Float(screenHeight - 20)))
//        present(homeAddCategoryVC, animated: true, completion: nil)
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    /// UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        navigationController?.pushViewController(HomeSearchViewController(), animated: false)
        return true
    }
}

extension HomeViewController {
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
}

