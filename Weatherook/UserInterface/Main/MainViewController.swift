//
//  MainViewController.swift
//  Weatherook
//
//  Created by 이영준 on 2018. 7. 13..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard
import Then

class MainViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    
    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt4: UILabel!
    @IBOutlet weak var txt5: UILabel!
    @IBOutlet weak var txt6: UILabel!
    
    @IBOutlet weak var txttemp1: UILabel!
    @IBOutlet weak var txttemp2: UILabel!
    @IBOutlet weak var txttemp3: UILabel!
    @IBOutlet weak var txttemp4: UILabel!
    @IBOutlet weak var txttemp5: UILabel!
    @IBOutlet weak var txttemp6: UILabel!
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    var weatherList : WeatherListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// 날씨설정
extension MainViewController{
    func setWeather(){
        weatherListDriver.subscribe{[weak self] event in
            let ele = event.element!?.data
            print("\((ele?[0].temp)!) / \(ele?[0].hour)")
            
            self?.txttemp1.text = "\((ele?[0].temp)!)°"
            self?.img1.image = self?.setWeatherImage((ele?[0].weather)!)
            
            self?.txt2.text = "\((ele?[1].temp)!)°"
            self?.txttemp2.text = "\((ele?[1].temp)!)°"
            self?.img2.image = self?.setWeatherImage((ele?[1].weather)!)
            
            
            self?.txt3.text = "\((ele?[2].temp)!)°"
            self?.txttemp3.text = "\((ele?[2].temp)!)°"
            self?.img3.image = self?.setWeatherImage((ele?[2].weather)!)
            
            
            self?.txt4.text = "\((ele?[3].temp)!)°"
            self?.txttemp4.text = "\((ele?[3].temp)!)°"
            self?.img4.image = self?.setWeatherImage((ele?[3].weather)!)
            
            
            self?.txt5.text = "\((ele?[4].temp)!)°"
            self?.txttemp5.text = "\((ele?[4].temp)!)°"
            self?.img5.image = self?.setWeatherImage((ele?[4].weather)!)
            
            
            self?.txt6.text = "\((ele?[5].temp)!)°"
            self?.txttemp6.text = "\((ele?[5].temp)!)°"
            self?.img6.image = self?.setWeatherImage((ele?[5].weather)!)
        }
    }
    
    func setWeatherImage(_ num : Int) -> UIImage{
        
        switch num {
        case 0:
            return #imageLiteral(resourceName: "mainSun2")
        case 1 :
            return #imageLiteral(resourceName: "mainCloudSun")
        case 2 :
            return #imageLiteral(resourceName: "mainCloud")
        case 3 :
            return #imageLiteral(resourceName: "mainRain8")
        case 4 :
            return #imageLiteral(resourceName: "mainSnow")
        case 5 :
            return #imageLiteral(resourceName: "mainSnow")
        default:
            return #imageLiteral(resourceName: "mainSun2")
        }
    }
//    enum WeatherNumber : Int{
//        case clean = 0
//        case litteCloudy = 1
//        case veryCloudy = 2
//        case rainy = 3
//        case rainyAndSnow = 4
//        case snow = 5
//    }
}
