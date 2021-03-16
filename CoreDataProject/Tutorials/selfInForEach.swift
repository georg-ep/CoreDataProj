//
//  selfInForEach.swift
//  CoreDataProject
//
//  Created by George Patterson on 15/03/2021.
//

import SwiftUI
/*
 When we use a foreach loop swift needs to know how to uniquely identify each dynamic view so that it can animate changes correclty
 
 The identifiable protocol automatically ises its id property
 
 If we dont use identifiable then we use the keypath, \.self
 
 When we use \.self for the identifier, we use the whole object
 Swift calculates the hash value of the struct
    this is a way of respresenting complex data in fixed sized values
    and then uses this hahs as the identifier
 
 When we create Hash Values, they all:
 regardless of input suze, have a fixed sized output
 calculating the same hash for an object rwice in a row should return the same value
 
 When xcode creates a class for our managed objetcs, it makes the class confrom to hashable
 this is a protocol which means that swift can generate hash values for it
    which in turn means we can use \.self as the idnetifier
 
 The same applies to strings, ints etc
 
 CoreData has a property called object ID
 an identifier unique to that object regardless of what properties it contains
 
 therefore \.self works with anything that conforms to hashable
 Core Data objects already conform to hashable
 
 
 */

//here student conforms to hashable bevause all of the properties already conform to hashable (string)
//so swift will calculate hash of each propetty and then combine them into one hash that represents the whole struct

struct Student: Hashable {
    let name: String
}

struct selfInForEach: View {
    
    let students = [Student(name: "name1"), Student(name:"name2")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct selfInForEach_Previews: PreviewProvider {
    static var previews: some View {
        selfInForEach()
    }
}
