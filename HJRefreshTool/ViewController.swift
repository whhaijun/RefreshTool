//
//  ViewController.swift
//  HJRefreshTool
//
//  Created by Haijun Si on 2020/8/4.
//  Copyright © 2020 chenganrt. All rights reserved.


import UIKit

class ViewController: UIViewController {

    let tableView = UITableView().then { (tb) in
        print("viewHeight==\(screenHeight)")
        tb.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        tb.separatorStyle = .none
    }
    
    private lazy var refreshTool = RefreshHelper.init(sv: self.tableView)
    
    var section = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshTool.openRefresh(topAction: { [weak self] in
            self?.section = 15
            self?.tableView.reloadData()
            self?.refreshTool.endTopRefresh()
        }) { [weak self] in
            self?.section += 15
            self?.tableView.reloadData()
            self?.refreshTool.endBottomRefresh()
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section
    }
}
