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
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Locations";
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationItem.title = "Locations";
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "";
    }
    
    
    
}
