//
//  ViewController.swift
//  ltt-uitableview
//
//  Created by 林東東 on 2021/7/15.
//

import UIKit

class ViewController: UIViewController {
    
    var sectionItem = ["Team 1","Team 2"]
    
    var dataSource = [
        ["Levy","Kent","Ting","Tony"],
        ["Ricky","Xuan","Yu"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        // 註冊 cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // 加入到畫面中
        self.view.addSubview(tableView)
        
        // 屬性
        // 分隔線的樣式
        tableView.separatorStyle = .singleLine
        
        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
        tableView.separatorInset =
            UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        
        // 是否可以點選 cell
        tableView.allowsSelection = true
        
        // 是否可以多選 cell
        tableView.allowsMultipleSelection = false
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // section
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionItem.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = sectionItem[section]
        return title
    }
    
    // cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let data = dataSource[indexPath.section][indexPath.row]
        if let label = cell.textLabel {
            label.text = data
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row \(indexPath.row)")
    }
    
}
