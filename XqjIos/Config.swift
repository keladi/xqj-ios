//
//  Config.swift
//  XqjIos
//
//  Created by sgzh on 2018/1/7.
//  Copyright © 2018年 boois. All rights reserved.
//

import Foundation
public class Config{
    var host:String=""
    public func setHost(host:String){
        self.host=host
    }
    public func getHost()->String{
        return self.host
    }
}
