//
//  UIView+Callback.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/5.
//  Copyright © 2018 zevwings. All rights reserved.
//

#if os(iOS) || os(tvOS)

import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIView {
    
    /// Reactive wrapper for `delegate`.
    ///
    /// For more information take a look at `DelegateProxyType` protocol documentation.
    public var delegate: DelegateProxy<UIView, RxViewCallbackDelegate> {
        return RxViewCallbackDelegateProxy.proxy(for: base)
    }
    
    public var callback: ControlEvent<RxViewCallbackData> {
        
        let source = delegate.methodInvoked(#selector(RxViewCallbackDelegate.callback(with:))).map { a -> RxViewCallbackData in

            let object = a[0]
            guard let returnValue = object as? RxViewCallbackData else {
                throw RxCocoaError.castingError(object: object, targetType: RxViewCallbackData.self)
            }
            
            return returnValue
        }
        
        return ControlEvent(events: source)
    }
    
    public func setCallbackDelegate(_ delegate: RxViewCallbackDelegate) -> Disposable {
        return RxViewCallbackDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
}

#endif

