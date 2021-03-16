//
//  FetchingWithNSPredicate.swift
//  CoreDataProject
//
//  Created by George Patterson on 15/03/2021.
//

import SwiftUI
import CoreData
/*
 NSPredicate allows us to show which results we want
 Predicates are simple tests and the test will be applies to eahc object in our core data entity
 
 Examples
 
 NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>

 Checks to see if the universe is one of the three options
 NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])

 Case sensitive
 NSPredicate(format: "name BEGINSWITH %@", "E"))
 
 With ignored case
 NSPredicate(format: "name BEGINSWITH[c] %@", "e"))

 Find all the ships that don't start with E
 NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))

 
 */

struct FetchingWithNSPredicate: View {
    @Environment(\.managedObjectContext) var moc
    
    //this fetches all the ships with universe set as star wars
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    //the %@ means add the data here, replaced with the next param
    //used to clean up '' marks
    

    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }

            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? self.moc.save()
            }
        }
    }
}

struct FetchingWithNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FetchingWithNSPredicate()
    }
}
