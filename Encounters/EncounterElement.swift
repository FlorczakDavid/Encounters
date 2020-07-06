//
//  EncounterElement.swift
//  Encounters
//
//  Created by david florczak on 19/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import Foundation
import SwiftUI

struct CampainElement: View {
    
    var title: String = ""
    
    var body: some View {
        HStack{
            Text(title)
                .font(.headline)
        }
    }
}
