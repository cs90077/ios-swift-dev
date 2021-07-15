//
//  ViewController.swift
//  ltt-uitableview-custom
//
//  Created by 林東東 on 2021/7/15.
//

import UIKit

class ViewController: UIViewController {

    var sectionItem = ["Team 1","Team 2"]
    
    var dataSource: [[UserData]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSource = UserData.fatchData()
        
        setupTableView()
    }
    
    func setupTableView() {
        
        let tableView = UITableView(frame: CGRect(
                                        x: 0, y: 20,
                                        width: self.view.bounds.width,
                                        height: self.view.bounds.height - 20),
                                    style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        // 註冊 section
        tableView.register(UINib(nibName: "CustomTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomTableViewHeader")
        // 註冊 cell
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        // 加入到畫面中
        self.view.addSubview(tableView)

    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // section
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionItem.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        let title = sectionItem[section]
    //        return title
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomTableViewHeader") as? CustomTableViewHeader else { return UITableViewHeaderFooterView() }
        headerView.lblTitle.text = sectionItem[section]
        return headerView
    }
    
    // cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let data = dataSource[indexPath.section][indexPath.row]
        cell.lblTitle.text = data.name
        cell.lblTag.text = data.devloper
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row \(indexPath.row)")
    }
    
}
