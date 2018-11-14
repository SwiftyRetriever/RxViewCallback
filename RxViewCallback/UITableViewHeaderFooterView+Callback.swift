//
//  UITableViewHeaderFooterView+Callback.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/5.
//  Copyright © 2018 zevwings. All rights reserved.
//

#if os(iOS) || os(tvOS)

import RxSwift
import RxCocoa
import UIKit

// MARK: - Rx

extension Reactive where Base: UITableViewHeaderFooterView {
    
    public func callback<T>(_ itemType: T.Type) -> ControlEvent<CallbackData<T>> {
        
        let source: Observable<CallbackData<T>> = callback.flatMap {
            [weak view = self.base as UITableViewHeaderFooterView] params -> Observable<CallbackData<T>> in
            
            guard let view = view,
                let superview = view.superview as? UITableView,
                let ip = view.indexPath else {
                    return Observable.empty()
            }
            
            var userInfo = params.userInfo ?? [:]
            userInfo[CallbackUserInfoKey.indexPath] = ip
            
            var data = CallbackData<T>()
            data.source = params.source
            data.object = params.object
            data.userInfo = userInfo
            data.item = try superview.rx.model(at: ip)

            return Observable.just(data)
        }
        
        return ControlEvent(events: source)
    }
    
    public func setCallbackDelegate(_ delegate: RxViewCallbackDelegate, indexPath: IndexPath) -> Disposable {
        self.base.indexPath = indexPath
        return RxViewCallbackDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
}

// MARK: - Ex

extension UITableViewHeaderFooterView {
    
    private struct _StorageKey {
        static var indexPath = "com.zevwings.eventHandler.indexPath"
    }
    
    public var indexPath: IndexPath? {
        get {
            return objc_getAssociatedObject(self, &_StorageKey.indexPath) as? IndexPath
        }
        set {
            objc_setAssociatedObject(self, &_StorageKey.indexPath, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

#endif
