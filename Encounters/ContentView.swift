//
//  ContentView.swift
//  Encounters
//
//  Created by david florczak on 11/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: CampainItem.getAllCampainItem()) var CampainItems: FetchedResults<CampainItem>
    
    @State private var newCampain = ""
    
    func addingSampleEncounters() {
        for campainItem in CampainItems {
            if campainItem.name == "sample campaign" { return }
        }
        let testingItem = CampainItem(context: self.managedObjectContext)
        testingItem.name = "sample campaign"
        testingItem.areas = [
        EncounterArea(name: "Plains",
                      encounterTypes: [
                        EncounterType(name: "monsters",
                                      weight: 4,
                                      encouters: [[
                                        Encounter(name: "goblins",
                                                  description: "A bunch of goblins come up to rob the party",
                                                  weight: 4,
                                                  amount: "2d4+2",
                                                  subType: nil),
                                        Encounter(name: "wolves",
                                                  description: "Hungry wolves",
                                                  weight: 4,
                                                  amount: "1d6+3",
                                                  subType: nil),
                                        Encounter(name: "Merchants",
                                                  description: "basically merchants",
                                                  weight: 2,
                                                  amount: nil,
                                                  subType: [[Encounter(name: "Human Merchants",
                                                                       description: "two human Merchants",
                                                                       weight: 9,
                                                                       amount: "2", subType: nil),
                                                             Encounter(name: "A goblin merchant",
                                                                       description: "a single goblin merchant",
                                                                       weight: 1,
                                                                       amount: "1",
                                                                       subType: nil)]])]]),
                        EncounterType(name: "Terrain",
                                      weight: 4,
                                      encouters: [[
                                        Encounter(name: "Storm",
                                                  description: "A roaring massive storm suprises the party, if the party can't find shelter in 2 hours, they all take one level of exhaustion",
                                                  weight: 2,
                                                  amount: nil,
                                                  subType: [[
                                                    Encounter(name: "heavy shower",
                                                              description: "A roaring massive storm suprises the party, if the party can't find shelter in 2 hours, they all take one level of exhaustion",
                                                              weight: 4,
                                                              amount: nil,
                                                              subType: nil),
                                                    Encounter(name: "Thunderous storm",
                                                              description: "A lightning bold hits the ground next to the party, everyone makes a DC18 dexterity saving throw, taking 6d6 lightning damage on a failed save, half as much on a success",
                                                              weight: 1,
                                                              amount: nil,
                                                              subType: nil)]]),
                                        Encounter(name: "Earthquake",
                                                  description: "each members of the party makes a DC13 dexterity saving throw, taking 3d6 bludgeoning damage on a failed save",
                                                  weight: 1,
                                                  amount: nil,
                                                  subType: nil)]]),
                        EncounterType(name: "no encounter",
                                      weight: 12,
                                      encouters: nil)]),
        EncounterArea(name: "Forest", encounterTypes: [
            EncounterType(name: "Monsters",
                          weight: 2,
                          encouters: [[Encounter(name: "driads",
                                                 description: "some randome draiads",
                                                 weight: 1,
                                                 amount: "1d2",
                                                 subType: nil)]]),
        EncounterType(name: "no Encounters",
                      weight: 8,
                      encouters: nil)])]
    }
        
    var body: some View {
        
        
        NavigationView{
            List{
                Section(header: Text("New campain?")) {
                    HStack{
                        TextField("New campain name", text: $newCampain)
                        Button(action: {
                            if self.newCampain == "" { return }
                            let campaign = CampainItem(context: self.managedObjectContext)
                            campaign.name = self.newCampain
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            
                            self.newCampain = ""
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("Campains")) {
                    ForEach(self.CampainItems) {Campain in
                        VStack{
                            NavigationLink(destination: EncounterAreaView(recievedCampain: Campain)) {
                                CampainElement(title: Campain.name)
                            }
                        }
                    }.onDelete{ indexSet in
                        let deleteItem = self.CampainItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }catch {
                            print(error)
                        }
                        
                    }
                }
            }
            .navigationBarTitle(Text("Campain List"))
            .navigationBarItems(trailing: EditButton())
        }
        .onAppear() {
            self.addingSampleEncounters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
