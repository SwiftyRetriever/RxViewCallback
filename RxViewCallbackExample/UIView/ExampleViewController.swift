//
//  ViewController.swift
//  RxViewCallbackExample
//
//  Created by 张伟 on 2018/11/14.
//  Copyright © 2018 zevwings. All rights reserved.
//

import UIKit
import RxViewCallback
import RxSwift

class ExampleViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        guard let exampleView = Bundle.main.loadNibNamed("ExmapleView", owner: self, options: nil)?.first as? ExmapleView else {
            return
        }
        
        exampleView.frame = view.frame
        exampleView.rx.setCallbackDelegate(self).disposed(by: disposeBag)
        exampleView.rx.callback(Int.self).subscribe(onNext: { data in
            print("click me responsed. data: \(data)")
            print("data.object: \(data.object ?? "")")
            print("data.userInfo: \(data.userInfo ?? [:])")
            print("item: \(data.item ?? 0)")
            
            self.dismiss(animated: true, completion: nil)
            
        }).disposed(by: disposeBag)
        
        view.addSubview(exampleView)
    }


}

extension ExampleViewController: RxViewCallbackDelegate {}
