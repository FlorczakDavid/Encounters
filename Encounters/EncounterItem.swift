//
//  EncounterItem.swift
//  Encounters
//
//  Created by david florczak on 19/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation
import CoreData

public class CampainItem: NSManagedObject, Identifiable {
    @NSManaged public var name: String
    var areas: [EncounterArea]?
}

extension CampainItem {
    static func getAllCampainItem() -> NSFetchRequest<CampainItem> {
        let request: NSFetchRequest<CampainItem> = CampainItem.fetchRequest() as! NSFetchRequest<CampainItem>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)

        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

struct EncounterArea: Hashable {
    var name: String = "New Encounter Area"
    var encounterTypes: [EncounterType]?
}

struct EncounterType: Hashable {    
    var name: String = "New Encounter Type"
    var weight: Int = 1
    var encouters: [[Encounter]]?
}

struct Encounter: Hashable {
    var name: String = "New Encounter"
    var description: String = ""
    var weight: Int = 1
    var amount: String? = nil
    var subType: [[Encounter]]?
}
