//
//  TableLIst.swift
//  Encounters
//
//  Created by david florczak on 19/05/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

struct TableLIst: View {
        @State var EncounterText = Text("Your encounter")
        var body: some View {
            VStack(alignment: .center) {
                Spacer()
                Text("Underdark Encounters")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.purple)
                    
                Spacer()
                Button(action: {
                    self.EncounterText = printEncouters()
                }) {
                    Text("Roll Encounters")
                        .font(.largeTitle)
                        .padding(.horizontal, 20.0)
                }
                Spacer()
                EncounterText
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }

struct TableLIst_Previews: PreviewProvider {
    static var previews: some View {
        TableLIst()
    }
}
