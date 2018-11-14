//
//  RxViewCallbackDelegate.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/5.
//  Copyright © 2018 zevwings. All rights reserved.
//

import UIKit

// 事件相响应链回掉代理
@objc public protocol RxViewCallbackDelegate: AnyObject {
    @objc optional func callback(with source: Any?, object: Any?, userInfo: [AnyHashable: Any]?)
}

public extension RxViewCallbackDelegate {
    
    func callback(with source: Any? = nil, object: Any? = nil) {
        callback?(with: source, object: object, userInfo: nil)
    }
}
