//
//  AdvertiseViewController.swift
//  bbh
//
//  Created by Leo on 2017/10/6.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class AdvertiseViewController: UIViewController {
    // 延迟 4 秒
    private var time: TimeInterval = 4.0
    
    private var countdownTimer: Timer?
    
    // @IBOutlet weak var timeButton: UIButton!
    
    var timeButton: UIButton!
    
    @IBOutlet weak var advertiseImage: UIImageView!
  
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        showButton()
        showBackground()
        // showImage()
    }
    
    @objc func updateTime(){
        if time == 0 {
            countdownTimer?.invalidate()
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: MyTabBarController.self)) as! MyTabBarController
            tabBarVC.delegate = self
            UIApplication.shared.keyWindow?.rootViewController = tabBarVC
        } else {
            time -= 1
            timeButton.setTitle(String(format: "%.f s 跳过", time), for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 点击停止计数器
    @IBAction func timeButtonClicked(_ sender: Any) {
        countdownTimer?.invalidate() // 移除计时器
        /// 从 sb 创建的 tabbarController 设置代理无效...
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: MyTabBarController.self))as! MyTabBarController
        tabBarVC.delegate = self
        UIApplication.shared.keyWindow?.rootViewController = tabBarVC
    }
    
}

// MARK: - 监听 tabbar 点击
extension AdvertiseViewController: UITabBarControllerDelegate {
    /// 点击了哪个 tabbar
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TabBarDidSelectedNotification"), object: nil)
    }}

// MARK： - 显示图片
extension AdvertiseViewController {
    func showImage(){
        let url = URL(string: "http://img.ivsky.com/img/tupian/pre/201509/13/tianzhukui.jpg")
        let data = try? Data(contentsOf: url!)
        if data != nil {
            let image = UIImage(data: data!)
            advertiseImage.image = image
        }
    }
    
    func showBackground(){
        // backgroundImage = UIImageView(image:)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"LaunchImage")!)
        // self.view.addSubview(backgroundImage)
    }
    
    func showButton(){
        //创建一个ContactAdd类型的按钮
        timeButton = UIButton(type:.custom)
        //设置按钮位置和大小
        timeButton.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        timeButton.setTitle("2s 跳过", for:.normal)
        timeButton.backgroundColor = UIColor.gray
        self.view.addSubview(timeButton)
    }
}
