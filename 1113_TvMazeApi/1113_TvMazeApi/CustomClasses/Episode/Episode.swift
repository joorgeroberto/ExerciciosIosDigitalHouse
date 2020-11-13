//
//  Episodes.swift
//  1113_TvMazeApi
//
//  Created by Jorge Roberto on 13/11/20.
//

import Foundation

class Episode: NSObject, NSCoding{

    
    var id : Int!
    var name : String!
    var number : Int!
    var summary : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        number = dictionary["number"] as? Int
        summary = dictionary["summary"] as? String
        summary = summary.replacingOccurrences(of: "<p>", with: "")
        summary = summary.replacingOccurrences(of: "</p>", with: "")

    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if number != nil{
            dictionary["number"] = number
        }
        if summary != nil{
            dictionary["summary"] = summary
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         number = aDecoder.decodeObject(forKey: "number") as? Int
         summary = aDecoder.decodeObject(forKey: "summary") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if number != nil{
            aCoder.encode(number, forKey: "number")
        }
        if summary != nil{
            aCoder.encode(summary, forKey: "summary")
        }

    }

}
