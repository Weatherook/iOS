//
//  ViewController.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 1..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit

// 초기화 ,
class ViewController: UIViewController {
    
    var viewModel : MainViewModelDelegate = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(viewModel.age)
        print(viewModel.arr)
        print(viewModel.name)
        print(viewModel.ej)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ViewController : UITableViewDelegate{
    
    
    

}

