//
//  Pneu.swift
//  
//
//  Created by Macmini_Dagon on 07.05.15.
//
//

import Foundation
import CoreData

class Pneu: NSManagedObject {

    @NSManaged var pneuidentifier: String
    @NSManaged var pneumarque: String
    @NSManaged var pneuprofil: String
    @NSManaged var pneureference: String
    @NSManaged var pneutype: String
    @NSManaged var moto: Moto

}
