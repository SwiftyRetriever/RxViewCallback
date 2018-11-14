//
//  RxViewCallbackData.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/3.
//  Copyright © 2018 zevwings. All rights reserved.
//

import Foundation

public struct CallbackUserInfoKey {
    public static let indexPath = "com.zevwings.rx.userinfo.indexPath"
}

public struct CallbackData<T> {
    
    public var object: Any?
    public var item: T?
    public var userInfo: [AnyHashable: Any]?
}
