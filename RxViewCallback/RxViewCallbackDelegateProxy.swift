//
//  RxCollectionViewCellDelegateProxy.swift
//  ADJAddress
//
//  Created by 张伟 on 2018/11/2.
//  Copyright © 2018 zevwings. All rights reserved.
//
#if os(iOS) || os(tvOS)

import UIKit
import RxSwift
import RxCocoa

extension UIView {
    
    private struct _StorageKey {
        static var delegate = "com.zevwings.eventHandler.delegate"
    }
    
    public weak var rxViewCallback: RxViewCallbackDelegate? {
        get {
            return objc_getAssociatedObject(self, &_StorageKey.delegate) as? RxViewCallbackDelegate
        }
        set {
            objc_setAssociatedObject(self, &_StorageKey.delegate, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

/// For more information take a look at `DelegateProxyType`.
open class RxViewCallbackDelegateProxy
    : DelegateProxy<UIView, RxViewCallbackDelegate>
    , DelegateProxyType
    , RxViewCallbackDelegate {
    
    var targetView: UIView
    
    /// - parameter scrollView: Parent object for delegate proxy.
    public init(targetView: ParentObject) {
        self.targetView = targetView
        super.init(parentObject: targetView, delegateProxy: RxViewCallbackDelegateProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxViewCallbackDelegateProxy(targetView: $0) }
    }
    
    public static func currentDelegate(for object: UIView) -> RxViewCallbackDelegate? {
        return object.rxViewCallback
    }
    
    public static func setCurrentDelegate(_ delegate: RxViewCallbackDelegate?, to object: UIView) {
        
        if object.rxViewCallback != nil { object.rxViewCallback = nil }
        return object.rxViewCallback = delegate
    }
}

#endif
