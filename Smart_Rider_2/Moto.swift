//
//  Moto.swift
//  
//
//  Created by Macmini_Dagon on 07.05.15.
//
//

import Foundation
import CoreData

class Moto: NSManagedObject {

    @NSManaged var motoannee: String
    @NSManaged var motoduedate: NSDate
    @NSManaged var motoidentifier: String
    @NSManaged var motokilometre: String
    @NSManaged var motomarque: String
    @NSManaged var motomodel: String
    @NSManaged var motoImage: NSData
    @NSManaged var pneu: NSSet
    @NSManaged var service: NSSet

}
