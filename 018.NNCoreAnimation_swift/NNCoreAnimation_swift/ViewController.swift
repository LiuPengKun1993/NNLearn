//
//  ViewController.swift
//  NNCoreAnimation_swift
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleArray = ["Position", "Scale", "Rotation", "透明度, 抖动, 背景色, 边框"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    // 懒加载
    lazy var tableView : UITableView = {
        let tempTableView = UITableView(frame: view.frame, style: .plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.tableFooterView = UIView()
        return tempTableView
    }()
    
}

/** 代理区域 */
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(NNPositionViewController(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(NNScaleViewController(), animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(NNRotationViewController(), animated: true)
            break
        case 3:
            self.navigationController?.pushViewController(NNOthersViewController(), animated: true)
            break
        default: break
        }
    }
}

