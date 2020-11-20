//
//  BaseClass.swift
//  1120_DesafioMvc
//
//  Created by Jorge Roberto on 20/11/20.
//

import Foundation


class BaseClass : NSObject, NSCoding{

    var id: String!
    var name: String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["codigo"] as? String
        name = dictionary["nome"] as? String
        if id == nil {
            if let codigoInt = dictionary["codigo"] as? Int{
                id = "\(codigoInt)"
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["codigo"] = id
        }
        if name != nil{
            dictionary["nome"] = name
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "codigo") as? String
         name = aDecoder.decodeObject(forKey: "nome") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "codigo")
        }
        if name != nil{
            aCoder.encode(name, forKey: "nome")
        }

    }

}
