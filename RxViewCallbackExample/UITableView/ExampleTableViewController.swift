//
//  ExampleTableViewController.swift
//  RxViewCallbackExample
//
//  Created by 张伟 on 2018/11/14.
//  Copyright © 2018 zevwings. All rights reserved.
//

import UIKit
import RxViewCallback
import RxCocoa
import RxSwift
import RxDataSources


class ExampleTableViewController: UITableViewController {

    private var disposeBag = DisposeBag()
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<ExampleSection>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dataSource = RxTableViewSectionedAnimatedDataSource<ExampleSection>(configureCell: {
            [unowned self] ds, tv, ip, item in
            
            let cell = tv.dequeueReusableCell(withIdentifier: "ExampleTableViewCell") as! ExampleTableViewCell
            
            // 需要获取当前单元格得数据时需要设置cell.indexPath属性
            // cell.indexPath = ip
            
            cell.rx.callback(String.self).subscribe(onNext: { data in
                
                print("click me responsed. data: \(data)")
                print("data.object: \(data.object ?? "")")
                print("data.userInfo: \(data.userInfo ?? [:])")
                print("item: \(data.item ?? "")")
                
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExampleViewController")
                self.present(viewController, animated: true, completion: nil)
                
            }).disposed(by: self.disposeBag)

            return cell
        }, titleForHeaderInSection: {
            ds, index in
            
            return ds.sectionModels[index].header
        })
        
        self.dataSource = dataSource
        
        let sections = [
            ExampleSection(header: "First section", items: ["1", "2"]),
            ExampleSection(header: "Second section", items: ["3", "4"])
        ]
        
        
        let a = Any.self
        print(a)
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExampleTableViewController: RxViewCallbackDelegate {}
