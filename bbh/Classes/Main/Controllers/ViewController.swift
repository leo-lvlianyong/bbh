//
//  ViewController.swift
//  bbh
//
//  Created by Leo on 2017/9/26.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getHTTPJsonData()
    }
    
    //
    func getHTTPJsonData(){
        let url = URL(string: "http://www.chepintou.cn:3541/car.wap/test/getJsonData")
        Alamofire.request(url!).validate().responseJSON { response in
            switch response.result.isSuccess {
                case true:
                    if let value = response.result.value {
                        let json = JSON(value)
                        print(json)
                        /*
                        if let message = json[0]["message"].string {
                            print("message:\(message)")
                        }
                        */
                    }
                case false:
                    print(response.result.error!)
            }
        }
    }
    
    func getHTTP(){
        Alamofire.request("http://www.chepintou.cn:3541/car.wap/test/getJsonData")
            .responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(String(describing: response.result.value))")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

