//
//  SplashInfoModel.swift
//  SwiftBilibili
//
//  Created by 罗文 on 2020/9/6.
//  Copyright © 2020 luowen. All rights reserved.
//

import ObjectMapper

import RealmSwift

enum SplashShowType: String {
    case half = "half"
    case full = "full"
}

class SplashInfoModel: Mappable {

    var pullInterval: Double = 1800
    var list: [SplashItemModel] = []
    var show: [SplashShowModel] = []

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        pullInterval <- map["pull_interval"]
        list <- map["list"]
        show <- map["show"]
    }
}

class SplashItemModel: Mappable {
    var id: Int = 0
    var thumb: String = ""
    var logoUrl: String = ""
    var mode: SplashShowType = .half

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        thumb <- map["thumb"]
        logoUrl <- map["logo_url"]
        mode <- map["mode"]
    }

}

class SplashShowModel: Mappable {
    var id: Int = 0
    var beginTime: Double = 0
    var endTime: Double = 0
    var duration: Int = 700

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        beginTime <- map["begin_time"]
        endTime <- map["end_time"]
        duration <- map["duration"]
    }
}

class SplashShowRealmModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var beginTime: Double = 0
    @objc dynamic var endTime: Double = 0
    @objc dynamic var thumb: String = ""
    @objc dynamic var logoUrl: String = ""
    @objc dynamic var isShow: Bool = false
    @objc dynamic var duration: Int = 700
    @objc dynamic var mode: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}
