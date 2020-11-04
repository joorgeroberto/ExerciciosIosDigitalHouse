//
//  ListsManager.swift
//  1030_iBuy
//
//  Created by Jorge Roberto on 30/10/20.
//

import Foundation

class ListsManager {
    private var open = [Item]()
    private var completed = [Item]()
    
    init(open: [Item], completed: [Item]) {
        self.open = open
        self.completed = completed
    }
    
    func insert(item: Item, list: Int) {
        if list == 0 {
            open.append(item)
        } else {
            completed.append(item)
        }
    }
    
    func remove(item: Item, list: Int) {
        print(item, list)
    }
    
    func toOpenForCompleted(item: Item) {
        for i in open {
            if i.name == item.name {
                remove(item: item, list: 0)
            }
            
        }
    }
    
    func getList(list: Int) -> [Item] {
        if(list == 0) {
            return open
        }
        return completed
    }
}
