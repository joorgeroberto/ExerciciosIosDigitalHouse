//
//  ConvertManager.swift
//  1111_ExercicioApi
//
//  Created by Jorge Roberto on 11/11/20.
//

//
//    Rate.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ConvertManager : NSObject, NSCoding{

    var base : String!
    var date : String!
    var rates : Rate!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        base = dictionary["base"] as? String
        date = dictionary["date"] as? String
        if let ratesData = dictionary["rates"] as? [String:Any]{
            rates = Rate(fromDictionary: ratesData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if base != nil{
            dictionary["base"] = base
        }
        if date != nil{
            dictionary["date"] = date
        }
        if rates != nil{
            dictionary["rates"] = rates.toDictionary()
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         base = aDecoder.decodeObject(forKey: "base") as? String
         date = aDecoder.decodeObject(forKey: "date") as? String
         rates = aDecoder.decodeObject(forKey: "rates") as? Rate

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if base != nil{
            aCoder.encode(base, forKey: "base")
        }
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if rates != nil{
            aCoder.encode(rates, forKey: "rates")
        }

    }

}
