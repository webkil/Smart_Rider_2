//
//  Service.swift
//  
//
//  Created by Macmini_Dagon on 07.05.15.
//
//

import Foundation
import CoreData

class Service: NSManagedObject {

    @NSManaged var servicefait: NSNumber
    @NSManaged var serviceidentifier: String
    @NSManaged var servicedate: NSDate
    @NSManaged var servicekilometre: String
    @NSManaged var moto: Moto

}
