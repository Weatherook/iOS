//
//  MainViewController.swift
//  Weatherook
//
//  Created by 양어진 on 2018. 7. 2..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


// 초기화 ,
class ViewController: UIViewController {
    
    var viewModel : MainViewModelDelegate = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(viewModel.age)
        print(viewModel.arr)
        print(viewModel.name)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
