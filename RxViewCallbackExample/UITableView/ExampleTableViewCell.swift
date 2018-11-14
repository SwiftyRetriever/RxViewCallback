//
//  ExampleTableViewCell.swift
//  RxViewCallbackExample
//
//  Created by 张伟 on 2018/11/14.
//  Copyright © 2018 zevwings. All rights reserved.
//

import UIKit
import RxViewCallback

class ExampleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func clickMe(_ sender: Any) {
        
        rxViewCallbackDelegate?.callback?(with: "call back object", userInfo: nil)
    }
}
