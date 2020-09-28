//
//  ItemManager.swift
//  0925_ExercicioListaDeCompras
//
//  Created by Jorge Roberto on 26/09/20.
//

import Foundation

class ItemManager {
    private var itemList = [Item]()
    
    // Create a new element if not exists.
    func create(name: String, quantity: Double) -> Item? {
        if !exists(name) {
            let item = Item(name: name, quantity: quantity)
            itemList.append(item)
            print(item.name)
            return item
        }
        
        return nil
    }
    
    func getItem(name: String) -> Item? {
        for item in itemList {
            if(item.name == name) {
                return item
            }
        }
        return nil
    }
    
    func getList() -> [Item]? {
        return itemList
    }
    
    // Verify if a item already exists.
    func exists(_ name: String) -> Bool {
        for item in itemList {
            if item.name == name {
               return true
            }
        }
        return false
    }
}
