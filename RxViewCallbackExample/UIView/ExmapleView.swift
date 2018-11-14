//
//  ExmapleView.swift
//  RxViewCallbackExample
//
//  Created by 张伟 on 2018/11/14.
//  Copyright © 2018 zevwings. All rights reserved.
//

import UIKit
import RxViewCallback

class ExmapleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .cyan
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func dismissButtonClicked(_ sender: Any) {
        rxViewCallbackDelegate?.callback?(with: "1", userInfo: nil)
    }
}
