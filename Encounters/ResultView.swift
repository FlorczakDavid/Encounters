//
//  ResultView.swift
//  Encounters
//
//  Created by david florczak on 06/07/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    
    @State var isDetailShown = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Area Name")
                    .font(Font.largeTitle)
                Spacer()
                HStack {
                    Text("X ")
                        .font(Font.title)
                        .bold()
                        .foregroundColor(Color.purple)
                    Button(action: {
                        self.isDetailShown = true
                    }){
                        Text("monsters")
                            .font(Font.title)
                            .bold()
                            .foregroundColor(Color.purple)
                    }
                }
                
                Spacer()
                Button(action: {
                    print("rolling encounter")
                }){
                    Text("Roll encounter")
                        .font(Font.headline)
                }
                Spacer()
            }
            if isDetailShown {
                ResultDescriptionVIew()
                    .onTapGesture {
                        self.isDetailShown = false
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
