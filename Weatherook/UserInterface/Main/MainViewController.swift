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
import Kingfisher
class MainViewController: UIViewController {

    @IBOutlet weak var mainScrollview: UIScrollView!
    
    
<<<<<<< HEAD
    
=======
//    @IBOutlet weak var img1: UIImageView!
//    @IBOutlet weak var img2: UIImageView!
//    @IBOutlet weak var img3: UIImageView!
//    @IBOutlet weak var img4: UIImageView!
//    @IBOutlet weak var img5: UIImageView!
//    @IBOutlet weak var img6: UIImageView!
//
//    @IBOutlet weak var txt1: UILabel!
//    @IBOutlet weak var txt2: UILabel!
//    @IBOutlet weak var txt3: UILabel!
//    @IBOutlet weak var txt4: UILabel!
//    @IBOutlet weak var txt5: UILabel!
//    @IBOutlet weak var txt6: UILabel!
//
//    @IBOutlet weak var txttemp1: UILabel!
//    @IBOutlet weak var txttemp2: UILabel!
//    @IBOutlet weak var txttemp3: UILabel!
//    @IBOutlet weak var txttemp4: UILabel!
//    @IBOutlet weak var txttemp5: UILabel!
//    @IBOutlet weak var txttemp6: UILabel!
//
//    @IBOutlet weak var txtMainWeather: UILabel!
>>>>>>> 89e421b8d0d6553846a23cd0a7925f4a8580209c
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    @IBOutlet weak var mainPageController: UIPageControl!
    //    @IBOutlet weak var txtMainTemp: UILabel!
//    @IBOutlet weak var txtMainRainPercent: UILabel!
//    @IBOutlet weak var txtMainTempMaxMin: UILabel!
    
//    @IBOutlet weak var txtMainSd: UILabel!
    
    let yesterSlide = Bundle.main.loadNibNamed("YesterSlide", owner: self, options: nil)![0] as! YesterSlide
    let todaySlide = Bundle.main.loadNibNamed("TodaySlide", owner: self, options: nil)![0] as! TodaySlide
    let tomSlide = Bundle.main.loadNibNamed("TommorowSlide", owner: self, options: nil)![0] as! TommorowSlide
    
    
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var txtWeather: UILabel!
    @IBOutlet weak var txtTemp: UILabel!
    
    

    
    var weatherList : WeatherListModel?
    var weatherCommend : WeatherCommendModel?
    var todayModel : TodayListModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        setWeather()
        setDelegate()
        tableviewInit()
//        mainTableView.delegate = self
//        mainTableView.datasource = self
=======
        setupSlideScrollView(slides: [tomSlide])
        mainScrollview.delegate = self
//        setWeather()
>>>>>>> 89e421b8d0d6553846a23cd0a7925f4a8580209c
    }
}
extension MainViewController : UITableViewDelegate{
    
}

extension MainViewController : UITableViewDataSource{
    
    func tableviewInit(){
        
        todayLastesDriver.subscribe{ [weak self] event in
            let el = event.element!
            self?.todayModel = el
            self?.mainTableView.delegate = self
            self?.mainTableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (todayModel?.data?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.row
        
        let topCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewHeaderCell",for:indexPath) as! MainTableViewHeaderCell
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "MainboardTableViewCell",for:indexPath) as! MainboardTableViewCell
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "MainCommentTableViewCell", for:indexPath) as!
        MainCommentTableViewCell
        let submitCell = tableView.dequeueReusableCell(withIdentifier:
            "MainCommentWriteTableViewCell", for: indexPath)
        if indexPath.row == 1 {
            
            
            return topCell
        } else if (indexPath.row % 3 ) - 1 == 0 && indexPath.row != 1 {
            
            
            return mainCell
        } else if (indexPath.row % 3 ) - 1 == 1 {
            
            
            return commentCell
        } else if (indexPath.row % 3 ) - 1 == 2 {
            
            
            return submitCell
        }
        return topCell
    }
    
    
}
extension MainViewController : UICollectionViewDelegate{
    func setDelegate(){
        boardCommendDriver.subscribe{ [weak self] event in
            guard let el = event.element! else {return}

            self?.weatherCommend = el
            self?.MainCollectionView.delegate = self
            self?.MainCollectionView.dataSource = self
//             self?.MainCollectionView!.collectionViewLayout = layout
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = (collectionView.bounds.width) - 20 / 2
//        let height = width
//
//        return CGSize(width: width, height: height)
//    }
}

extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
//            (weatherCommend?.data?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendCollectionViewCell", for: indexPath) as! MainRecommendCollectionViewCell
        let img = weatherCommend?.data?[indexPath.row].commendImg!
        cell.imgReccomend.kf.setImage(with: URL(string:img!))
        return cell
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    // In case of vertical layout this is a vertical space between horizontal rows inside of each section
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // Horizontal space between items in row
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
// 날씨설정
extension MainViewController{
//    func setWeather(){
//        weatherListDriver.subscribe{[weak self] event in
//            let ele = event.element!?.data
//            print("\((ele?[0].temp)!) / \(ele?[0].hour)")
//
//            self?.txttemp1.text = "\((ele?[0].temp)!)°"
//            self?.img1.image = self?.setWeatherImage((ele?[0].weather)!)
//
//            self?.txt2.text = "\((ele?[1].temp)!)°"
//            self?.txttemp2.text = "\((ele?[1].temp)!)°"
//            self?.img2.image = self?.setWeatherImage((ele?[1].weather)!)
//
//
//            self?.txt3.text = "\((ele?[2].temp)!)°"
//            self?.txttemp3.text = "\((ele?[2].temp)!)°"
//            self?.img3.image = self?.setWeatherImage((ele?[2].weather)!)
//
//
//            self?.txt4.text = "\((ele?[3].temp)!)°"
//            self?.txttemp4.text = "\((ele?[3].temp)!)°"
//            self?.img4.image = self?.setWeatherImage((ele?[3].weather)!)
//
//
//            self?.txt5.text = "\((ele?[4].temp)!)°"
//            self?.txttemp5.text = "\((ele?[4].temp)!)°"
//            self?.img5.image = self?.setWeatherImage((ele?[4].weather)!)
//
//
//            self?.txt6.text = "\((ele?[5].temp)!)°"
//            self?.txttemp6.text = "\((ele?[5].temp)!)°"
//            self?.img6.image = self?.setWeatherImage((ele?[5].weather)!)
//        }
//    }
    
    
    
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
}

// 스크롤뷰 페이징
extension MainViewController{
    func setupSlideScrollView(slides : [UIView]){
        
        mainScrollview.frame = CGRect(x: 0, y: 0, width: CGFloat(360.0), height: view.frame.height)
        mainScrollview.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        mainScrollview.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width , height: view.frame.height)
            mainScrollview.addSubview(slides[i])
        }
    }
}
// 페이지스크롤
extension MainViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        mainPageController.currentPage = Int(pageIndex)
        mainPageController.currentPageIndicatorTintColor = UIColor(red:0.45, green:0.09, blue:1.00, alpha:1.00)
        mainPageController.pageIndicatorTintColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00)
        
        mainScrollview.isDirectionalLockEnabled = true
        mainScrollview.showsVerticalScrollIndicator = false
        mainScrollview.showsHorizontalScrollIndicator = false
    }
}
