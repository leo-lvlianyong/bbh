//
//  HomeNavigationBar.swift
//  bbh
//
//  Created by Leo on 2017/10/10.
//  Copyright © 2017年 Leo. All rights reserved.
//
// 导航搜索栏

import UIKit
import SnapKit

class HomeNavigationBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加今日头条 图片
        addSubview(toutiaoImageView)
        // 添加 搜索框
        addSubview(searchBar)
        
        toutiaoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(kMargin)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 72, height: 20))
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.left.equalTo(toutiaoImageView.snp.right).offset(kMargin)
            make.right.equalTo(self).offset(-kMargin)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 今日头条 图片
    lazy var toutiaoImageView: UIImageView = {
        let toutiaoImageView = UIImageView(image: UIImage(named: UserDefaults.standard.bool(forKey: isNight) ? "title_night_72x20_" : "title_72x20_"))
        toutiaoImageView.contentMode = .scaleAspectFill
        return toutiaoImageView
    }()
    
    // 搜索框
    lazy var searchBar: HomeSearchBar = {
        // 搜索框
        let searchBar = HomeSearchBar.searchBar()
        // 默认显示占位文字
        searchBar.placeholder = "搜你想搜的"
        // 设置背景
        searchBar.background = UIImage(named: "searchbox_search_20x28_")
        
        return searchBar
    }()
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            let newFrame = CGRect(x: 0, y: 0, width: screenWidth, height: 44)
            super.frame = newFrame
        }
    }

}
