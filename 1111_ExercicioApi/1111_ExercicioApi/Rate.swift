//
//  Rate.swift
//  1111_ExercicioApi
//
//  Created by Jorge Roberto on 11/11/20.
//
//
//    Rate.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Rate : NSObject, NSCoding{

    var bRL : Double!
    var uSD : Double!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        bRL = dictionary["BRL"] as? Double
        uSD = dictionary["USD"] as? Double
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if bRL != nil{
            dictionary["BRL"] = bRL
        }
        if uSD != nil{
            dictionary["USD"] = uSD
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         bRL = aDecoder.decodeObject(forKey: "BRL") as? Double
         uSD = aDecoder.decodeObject(forKey: "USD") as? Double

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if bRL != nil{
            aCoder.encode(bRL, forKey: "BRL")
        }
        if uSD != nil{
            aCoder.encode(uSD, forKey: "USD")
        }

    }

}
