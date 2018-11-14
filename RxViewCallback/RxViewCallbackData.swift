//
//  RxViewCallbackData.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/3.
//  Copyright © 2018 zevwings. All rights reserved.
//

import Foundation

public protocol CallbackEnventType {}

// MARK: - Base

open class RxViewCallbackData: NSObject {
    
    var event: CallbackEnventType?
    
    public init(event: CallbackEnventType? = nil) {
        super.init()
        self.event = event
    }
}

// MARK: - UICollectionView

open class RxCollectionViewCallbackData<T>: RxViewCallbackData {
    var indexPath: IndexPath?
    var item: T?
}

// MARK: - UITableView

open class RxTableViewCallbackData<T>: RxViewCallbackData {
    var indexPath: IndexPath?
    var item: Any?
}

