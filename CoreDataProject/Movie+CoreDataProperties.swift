//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by George Patterson on 15/03/2021.
//
//

import Foundation
import CoreData

/*
 
 This class was generated changing the codegen of the entity.
 Manual/None gives us full control over how we create the class
 
 On creation, editor > create NSManagedObject subclass, save in the yellow folder INSIDE the poj dir (same dir as assets etc)
 
 Saving changes
 
 We should always wrap our try? self.moc.save() in a if self.moc.hasChanges
 
 this checks that coredata has changes to save beofre saving and makes a big performance impact
 
 CONSTRAINTS
 
 we can make attributes constrained so that it must always be unique
 coredata then handles all the work with resolving duplicate entities etc
 
 
 */

extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    /*
     NSManaged is not a property wrapper
     This shows how core data works internally
     rather than values existing as properties in the class
     they are really there to read and write from a dictionary that core data uses to store info
     When we read/write the value of a property, that is @NSManaged, core data catches that and handles it internally
    
     
     Optionals
     We can simply remove the optionality from the strings and create a new Movie without providing these values
     THESE PROPERTIES HERE AREN'T REAL - even though it permits this, it might still fail
     DataCore is lazy
     Sometimes it looks like data has been loaded when it really hasnt
     this is because core data is trying to reduce memory impact, these are called faults
        a fault line being something existing and something just being a placeholder
     */
    
    //this code allows us to handle the optinality of a title with no value
    private var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
}

extension Movie : Identifiable {

}
