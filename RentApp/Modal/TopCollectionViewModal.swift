//
//  TopCollectionViewModal.swift
//  RentApp
//
//  Created by Can Kalender on 17.04.2019.
//  Copyright © 2019 Can Kalender. All rights reserved.
//

import Foundation
import UIKit
public class TopCollectionViewModal{
    
    var houseInfo = HouseInfo();
    
    public init(noticeLabel:String,priceLabel:String,accomodationTypeLabel:String,starLabel:String,locationLabel:String,stayedPeopleLabel:String,houseImageView:UIImageView){
        houseInfo.noticeLabel = noticeLabel;
        houseInfo.priceLabel = priceLabel
        houseInfo.accomodationTypeLabel = accomodationTypeLabel
        houseInfo.starLabel = starLabel
        houseInfo.locationLabel = locationLabel
        houseInfo.stayedPeopleLabel = stayedPeopleLabel
        houseInfo.houseImageView = houseImageView
        
    }
    
    
}

public class HouseInfo{
    public var noticeLabel: String?
    public var priceLabel: String?
    public var accomodationTypeLabel:String?
    public var starLabel:String?
    public var locationLabel: String?
    public var stayedPeopleLabel:String?
    public var houseImageView:UIImageView?
}
