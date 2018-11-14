//
//  UICollectionView+EventResponseChain.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/2.
//  Copyright © 2018 zevwings. All rights reserved.
//

#if os(iOS) || os(tvOS)

import RxSwift
import RxCocoa
import UIKit

// MARK: - Rx

extension Reactive where Base: UICollectionReusableView {

    public func callback<T>(_ itemType: T.Type) -> ControlEvent<RxCollectionViewCallbackData<T>> {

        let source: Observable<RxCollectionViewCallbackData<T>> = callback.flatMap { [weak view = self.base as UICollectionReusableView] data -> Observable<RxCollectionViewCallbackData<T>> in

            guard let data = data as? RxCollectionViewCallbackData<T>,
                let view = view,
                let superview = view.superview as? UICollectionView,
                let ip = view.indexPath else {
                return Observable.empty()
            }

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

extension UICollectionReusableView {
    
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
