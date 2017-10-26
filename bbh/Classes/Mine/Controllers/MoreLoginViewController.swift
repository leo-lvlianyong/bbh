//
//  MoreLoginViewController.swift
//  bbh
//
//  Created by Leo on 2017/10/9.
//  Copyright © 2017年 Leo. All rights reserved.
//
// 登录注册

import UIKit
import IBAnimatable
import RxSwift
import RxCocoa

class MoreLoginViewController: AnimatableModalViewController, StoryboardLoadable {
    
    let minUsernameLength = 5
    let maxUsernameLength = 10
    let minPasswordLength = 5
    let maxPasswordLength = 16
    let disposBag = DisposeBag()
    
    @IBOutlet weak var phonenumberTF: UITextField!
    @IBOutlet weak var phonenumberLB: UILabel!
    @IBOutlet weak var vcodeTF: UITextField!
    @IBOutlet weak var vcodeLB: UILabel!
    @IBOutlet weak var vcodeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupRx()
    }
    
}

/*
extension MoreLoginViewController {
    private func setupRx() {
        /// 验证用户输入是否有效
        let phonenumberValid: Observable = phonenumberTF.rx.text.orEmpty.map{
                    newphonenumber in newphonenumber.characters.count > 5
        }
        let vcodeValid: Observable = vcodeTF.rx.text.orEmpty.map{
            newvcode in newvcode.characters.count > 5
        }
        
        phonenumberValid.bind(to: phonenumberLB.rx.isHidden).disposed(by: disposBag)
        
        vcodeValid.bind(to: vcodeLB.rx.isHidden).disposed(by: disposBag)
        
        let phoneAndvcode: Observable = Observable.combineLatest(phonenumberTF.rx.text.orEmpty, vcodeTF.rx.text.orEmpty){
            (phone, vcode) in (phone, vcode)
        }
        
        let rxUser: Observable = loginBtn.rx.tap.withLatestFrom(phoneAndvcode).do(
            onNext: { [weak self] _ in
                self?.vcodeLB.text = "正在登录，请稍后..."
                self?.view.endEditing(true)
            }).flatMapLatest(GithubApi.login)
        
        // 显示登录结果
        rxUser.observeOn(MainScheduler.instance)
            .map { user in
                user == nil ? "登录失败，请稍后重试" : "(user!.nickname) 您已成功登录"
            }
            .bind(to: vcodeLB.rx.text)
            .disposed(by: disposBag)
    }
}
 */

enum GithubApi {
    // 封装网络请求的方法
    public static func login(username: String, password: String) -> Observable<Any> {
        guard
            let baseURL = URL(string: "https://api.github.com"),
            let url = URL(string: "users/leo", relativeTo: baseURL)
        else {
            return Observable.just((Any).self)
        }
        
        return URLSession.shared.rx.json(url: url)
            .catchErrorJustReturn(["id": "10000", "nickname": "luojie"]) // 由于此接口不存在，所以出错就直接返回演示数据
            .map(User.init) // 解析 json
    }
}

struct User {
    let id: String?
    let nickname: String?
    
    /// 解析json
    init?(json: Any) {
        guard
            let dictionary = json as? [String: Any],
            let id = dictionary["id"] as? String,
            let nickname = dictionary["nickname"] as? String
        else {
            return nil
        }
        
        self.id = id
        self.nickname = nickname
    }
}

extension MoreLoginViewController {
    /// 关闭按钮点击
    @IBAction func closeLoginViewButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
