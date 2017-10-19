//
//  MineViewController.swift
//  bbh
//
//  Created by Leo on 2017/9/27.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit
import IBAnimatable
import RxSwift
import RxCocoa

class MineViewController: UITableViewController {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate var sections = [AnyObject]()
    // fileprivate var concerns = [MyConcern]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MineViewController viewWillAppear 开始动作")
        // 设置导航头隐藏
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("MineViewController viewWillAppear 结束动作")
        // 设置导航头显示
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        NoLoginHeaderViewClicked()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 头部视图
    fileprivate lazy var noLoginHeaderView: NoLoginHeaderView = {
        return NoLoginHeaderView.loadViewFromNib()
    }()

}

// 【拓展】头部显示视图点击事件
extension MineViewController {
    // 点击头部上的一些操作
    fileprivate func NoLoginHeaderViewClicked(){
        noLoginHeaderView.moreLoginButton.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
            // 弹出登录界面
            let moreLoginVC = MoreLoginViewController.loadStoryboard()
            // moreLoginVC.modalSize = (width: .full, height: .custom(size: Float(screenHeight - 40)))
            moreLoginVC.modalSize = (width: .full, height: .full)
            self!.present(moreLoginVC, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
}

// 【拓展】头部显示视图
extension MineViewController {
    
    fileprivate func setUI(){
        /// 设置 tableView 属性
//        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        
        tableView.tableHeaderView = noLoginHeaderView
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
        // tableView.ym_registerCell(cell: MineFirstSectionCell.self)
        tableView.ym_registerCell(cell: MineOtherCell.self)
    }
    
}

// MARK: - Table view data source
extension MineViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return sections.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].count
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 && indexPath.row == 0 {
//            return (concerns.count == 0 || concerns.count == 1) ? 40 : 114
//        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 1 : 10
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
//        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 && indexPath.row == 0 {
//            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MineFirstSectionCell
//            let section = sections[0] as! [AnyObject]
//            let mineCellModel = section[0]  as! MineCellModel
//            cell.selectionStyle = .none
//            cell.delegate = self
//            cell.mineCellModel = mineCellModel
//            if concerns.count == 0 || concerns.count == 1 {
//                cell.collectionView.isHidden = true
//            }
//            if concerns.count == 1 {
//                cell.myConcern = concerns[0]
//            }
//            if concerns.count > 1 {
//                cell.concerns = concerns
//                cell.collectionView.isHidden = false
//            }
//            return cell
//        }
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MineOtherCell
//        let section = sections[indexPath.section] as! [AnyObject]
//        let mineCellModel = section[indexPath.row]  as! MineCellModel
//        cell.mineCellModel = mineCellModel
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 { // 我的关注
            let myConcernVC = MyConcernController()
            myConcernVC.myConcerns = concerns
            navigationController?.pushViewController(myConcernVC, animated: true)
        } else if indexPath.section == 1 { // 消息通知
            
        } else if indexPath.section == 2 { // 头条商城，京东特供
            
        }  else if indexPath.section == 3 { // 我要爆料，用户反馈，系统设置
            if indexPath.row == 2 { // 系统设置
//                self.navigationController?.pushViewController(SettingViewController(), animated: true)
            }
        }
    }
    */
    // MARK: - UIScrollViewDelagate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if offsetY < 0 {
            let totalOffset = kMineHeaderViewHieght + abs(offsetY)
            let f = totalOffset / kMineHeaderViewHieght
//            noLoginHeaderView.bgImageView.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
