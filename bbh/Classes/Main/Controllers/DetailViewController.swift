//
//  DetailViewController.swift
//  bbh
//
//  Created by Leo on 2017/10/6.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    var itemString: String?
    
    var button: UIButton = UIButton(type:.contactAdd)

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = itemString
        
        
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        button.setTitle("返回", for: .normal)
        button.addTarget(self, action: #selector(previousPage(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func previousPage(_ sender: UIButton) {
        // self.performSegue(withIdentifier: "ShowDetailView", sender: itemString)
        self.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    

}
