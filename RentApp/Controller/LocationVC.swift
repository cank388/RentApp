//
//  LocationVC.swift
//  RentApp
//
//  Created by Can Kalender on 12.04.2019.
//  Copyright © 2019 Can Kalender. All rights reserved.
//

import Foundation
import UIKit

class LocationVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar();
    }
    func initNavigationBar(){
        self.navigationItem.title = "Discover"
    }
}
