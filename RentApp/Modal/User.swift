//
//  User.swift
//  RentApp
//
//  Created by Can Kalender on 12.04.2019.
//  Copyright © 2019 Can Kalender. All rights reserved.
//

import Foundation

public class UserInfo {
    public var userID: String?
    public var mail: String?
    public var name:String?
    public var surname:String?
}

public class User{
    
    var userInfo = UserInfo();
    
    init(mail: String, name: String, surname: String) {
        userInfo.mail = mail;
        userInfo.name = name;
        userInfo.surname = surname;
    }
    
    public func SetUserID(userID: String) {
        userInfo.userID = userID;
    }
}
