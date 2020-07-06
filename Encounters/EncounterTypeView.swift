//
//  EncouterTypeView.swift
//  Encounters
//
//  Created by david florczak on 22/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

let testingEncounterTypes = [EncounterType(name: "no encounter",
                                           weight: 16,
                                           encouters: nil),
                             EncounterType(name: "Creature encounter",
                                           weight: 2,
                                           encouters: nil),
                             EncounterType(name: "Terrain encounter",
                                           weight: 2,
                                           encouters: nil)]

struct EncounterTypeView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: CampainItem.getAllCampainItem()) var CampainItems: FetchedResults<CampainItem>
    
    
    @State var newEncounterType = ""
    
    @State private var newCampain = ""
    
    
    var recievedCampain: FetchedResults<CampainItem>.Element?
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New campain?")) {
                    HStack{
                        TextField("New encounter type name", text: $newEncounterType)
                        TextField("Weight?", text: $newEncounterType)
                        Button(action: {
                            let campaign = CampainItem(context: self.managedObjectContext)
                            campaign.name = self.newCampain
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            
                            self.newEncounterType = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section {
                    ForEach(testingEncounterTypes, id: \.self) { encounterType in
                        HStack {
                            Text(encounterType.name).font(.headline)
                            Spacer()
                            Text("weight: \(encounterType.weight)").font(.footnote)
                        }
                    }
                }
            }
//            .navigationBarTitle(title, displayMode: .inline)
        }
    }
}

struct EncouterTypeView_Previews: PreviewProvider {
    static var previews: some View {
        EncounterTypeView()
    }
}
