//
//  MySection.swift
//  RxViewCallbackExample
//
//  Created by 张伟 on 2018/11/14.
//  Copyright © 2018 zevwings. All rights reserved.
//

import Foundation
import RxDataSources

struct ExampleSection {
    var header: String
    var items: [Item]
}

extension ExampleSection : AnimatableSectionModelType {
    typealias Item = String
    
    var identity: String {
        return header
    }
    
    init(original: ExampleSection, items: [Item]) {
        self = original
        self.items = items
    }
}
