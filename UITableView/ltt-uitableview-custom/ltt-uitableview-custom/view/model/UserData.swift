//
//  UserData.swift
//  ltt-uitableview-custom
//
//  Created by 林東東 on 2021/7/15.
//

import Foundation

struct UserData {
    let name: String
    let devloper: String
    let level: Int
    let salary: Int
    
    init(name: String, devloper: String, level: Int, salary: Int) {
        self.name = name
        self.devloper = devloper
        self.level = level
        self.salary = salary
    }
    
    static func fatchData() -> [[UserData]] {
        
        let data = [
            [
                UserData.init(name: "Levy", devloper: "iOS", level: 100, salary: 10000),
                UserData.init(name: "Kent", devloper: "iOS", level: 50, salary: 6000),
                UserData.init(name: "Ting", devloper: "iOS", level: 40, salary: 3000),
                UserData.init(name: "Tony", devloper: "iOS", level: 10, salary: 100)
            ],
            [
                UserData.init(name: "Ricky", devloper: "Android", level: 100, salary: 10000),
                UserData.init(name: "Xuan", devloper: "Android", level: 60, salary: 8000),
                UserData.init(name: "Yu", devloper: "Android", level: 40, salary: 3000),
            ]
        ]
    
        return data
    }
    
}
