//
//  MainVC.swift
//  RentApp
//
//  Created by Can Kalender on 12.04.2019.
//  Copyright © 2019 Can Kalender. All rights reserved.
//

import Foundation
import UIKit

class MainVC:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    var emptyCell = UICollectionViewCell();
    //topCollectionView Arrays
    let array0 = ["Hot This Month","Great Rating","Great Rating"]
    let array1 = ["$1200","$1200","$1200"]
    let array2 = ["Fresh Apartment","Old Town Flat","Old Town Flat"]
    let array3 = ["4 stars","4 stars","4 stars"]
    let array4 = ["Bratislava","Prague","Prague"]
    let array5 = ["3","4","5"]
    let apartmentImages:[UIImage] = [UIImage(named: "image")!,UIImage(named: "image")!,UIImage(named: "image")!]
    
    //middleCollectionView Arrays
    let userArrayImages:[UIImage] = [UIImage(named: "photo")!,UIImage(named: "photo2")!,UIImage(named: "photo3")!]
    let userNameArray = ["Jerry Wise", "Leo Miles", "Allie Seek"]
    let userStarArray = ["5 stars","5 stars","5 stars"]
    let userOffersArray = ["129 Offers", "76 Offers", "51 Offers"]
    
    //bottomCollectionView Arrays
    let newsImagesArray:[UIImage] = [UIImage(named: "image")!,UIImage(named: "image")!,UIImage(named: "image")!]
    let newsPriceArray = ["$420","$500","$600"]
    
    
    //navbar Image View
    var imageView:UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        initNavigationBar()
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.showsHorizontalScrollIndicator = false
        topCollectionView.showsVerticalScrollIndicator = false
        
        middleCollectionView.dataSource = self
        middleCollectionView.delegate = self
        middleCollectionView.showsVerticalScrollIndicator = false
        middleCollectionView.showsHorizontalScrollIndicator = false
        
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.showsVerticalScrollIndicator = false
        bottomCollectionView.showsHorizontalScrollIndicator = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.title = "";
        showImage(false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Discover"
        showImage(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationItem.title = "Discover"
        showImage(true)
    }


    private func showImage(_ show: Bool) {
        UIView.animate(withDuration: 0.1) {
            self.imageView.alpha = show ? 1.0 : 0.0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCollectionViewCell;
            cell.noticeLabel.text = array0[indexPath.row]
            cell.priceLabel.text = array1[indexPath.row]
            cell.accomodationTypeLabel.text = array2[indexPath.row]
            cell.starLabel.text = array3[indexPath.row]
            cell.locationLabel.text = array4[indexPath.row]
            cell.stayedPeopleLabel.text = array5[indexPath.row]
            cell.houseImageView.image = apartmentImages[indexPath.item]
            return cell;
        }else if collectionView == self.middleCollectionView{
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! MiddleCollectionViewCell;
            
            cell.userImageView.image = userArrayImages[indexPath.item]
            cell.userNameLabel.text = userNameArray[indexPath.row]
            cell.userOfferLabel.text = userOffersArray[indexPath.row]
            cell.userStarLabel.text = userStarArray[indexPath.row]

            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 15
                //CGFloat(roundf(Float(cell.frame.size.width/2.0)))
       

            return cell;
        }else if collectionView == self.bottomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! BottomCollectionViewCell;
            cell.newsImageView.image = newsImagesArray[indexPath.item]
            cell.newsPriceLabel.text = newsPriceArray[indexPath.row]
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            return cell;
        }else{
            return emptyCell;
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func initNavigationBar(){
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.barTintColor = UIColor.clear;
        self.tabBarController?.tabBar.isTranslucent = true;
        //self.tabBarController?.tabBar.backgroundColor = .clear
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        imageView = UIImageView(image: UIImage(named: "magnifying-glass (1)"))
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 3
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])
        
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
    
    public func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    
}

public struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 30
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 24
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}
