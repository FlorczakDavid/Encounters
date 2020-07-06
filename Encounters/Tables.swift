//
//  Tables.swift
//  Encounters
//
//  Created by david florczak on 11/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation
import SwiftUI

let encounter = ["Terrain","Terrain","Monster","Monster","Monster and Terrain","Monster and Terrain","Monster and Terrain","none","none","none","none","none","none","none","none","none","none","none","none","none"]
let terrainEncounter = ["Boneyard","Cliff and Ladder","Crsytal cluster","Fungus Cavern","Gas Leak","Gorge","High Ledge","Horrid Sounds","Lava Swell","Muck Pit","Rock Fall","Rope Bridge","Ruins","Shelter","Sinkhole","Slime or Mold","Steam Vent","Underground Stream","Warning Sign","Webs"]
let monsterEncouter = ["Spore Servant","Carrion Crawler","Society of Brilliance","Scouts","Ochre jelly","Mad creature","Traders","Traders","Giant fire beetles","Giant fire beetles","Raiders","Raiders","Fungi","Fungi","Escaped slaves","Escaped slaves","Giant 'rocktopus'","Giant 'rocktopus'"]
let spaceAndMarchingOrder = ["standard passageway","large open area","standard passageway"]
let illumination = ["Darkness","Darkness","Darkness","Dim light (non-Faerzress)","Dim light (non-Faerzress)","Dim light (Faerzress)"]

func printEncouters() -> Text {
    
    let spaceAndIllumination = spaceAndMarchingOrder[Int(arc4random_uniform(UInt32(spaceAndMarchingOrder.count)))] + "\n" + illumination[Int(arc4random_uniform(UInt32(illumination.count)))]
    
    
    let firstCheck = encounter[Int(arc4random_uniform(UInt32(encounter.count)))]
    if firstCheck == "none" { return Text("no encounter") }
    if firstCheck == "Terrain" {
        let terrainEnc = terrainEncounter[Int(arc4random_uniform(UInt32(terrainEncounter.count)))]
        return Text(spaceAndIllumination) + Text(terrainEnc)
    }
    if firstCheck == "Monster" {
        let monsterEnc = monsterEncouter[Int(arc4random_uniform(UInt32(monsterEncouter.count)))]
        return Text(spaceAndIllumination) + Text(monsterEnc)
    }
    if firstCheck == "Monster and Terrain" {
        let terrainEnc = terrainEncounter[Int(arc4random_uniform(UInt32(terrainEncounter.count)))]
        let monsterEnc = monsterEncouter[Int(arc4random_uniform(UInt32(monsterEncouter.count)))]
        return Text(spaceAndIllumination) + Text(terrainEnc) + Text(monsterEnc)
    }
    
    return Text("no encounter")
}



struct Tables_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
