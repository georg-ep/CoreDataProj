//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by George Patterson on 15/03/2021.
//

import SwiftUI

struct FilteredList: View {
    //store fetch request so we can loop over it in the body
    var fetchRequest: FetchRequest<Singer>
    
    var body: some View {
        
        //we read the fetch request of the wrapped value
        //this pulls our data out
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "")
    }
}
