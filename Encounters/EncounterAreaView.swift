//
//  EncounterAreaView.swift
//  Encounters
//
//  Created by david florczak on 01/06/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

struct EncounterAreaView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var recievedCampain: FetchedResults<CampainItem>.Element?
    
    //    @State var encounterAreas: [EncounterArea]?
    @State var newEncounterArea = ""
    
    
    var body: some View {
            List {
                Section(header: Text("New Area?")) {
                    HStack{
                        TextField("New area name", text: $newEncounterArea)
                        Button(action: {
                            if self.newEncounterArea == "" { return }
                            self.recievedCampain!.areas?.append(EncounterArea(name: self.newEncounterArea, encounterTypes: nil))
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            
                            self.newEncounterArea = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("Encounter Areas")) {
                    ForEach(recievedCampain!.areas ?? [], id: \.self) { encounterArea in
                        VStack {
                            HStack {
                                NavigationLink(destination: ResultView()) {
                                    Text(encounterArea.name).font(.headline)
                                }
                                Spacer()
                                Button(action: {
                                    print("button")
                                }){
                                    Text("Edit")
                                        .foregroundColor(Color.blue)
                                }
                            }
                        }
                    }.onDelete{ indexSet in
                        self.recievedCampain!.areas!.remove(at: indexSet.first! as Int)
                        
                        do {
                            try self.managedObjectContext.save()
                        }catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text(recievedCampain!.name), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
    }
}

struct EncounterAreaView_Previews: PreviewProvider {
    static var previews: some View {
        EncounterAreaView()
    }
}
