//
//  ResultDescriptionVIew.swift
//  Encounters
//
//  Created by david florczak on 06/07/2020.
//  Copyright © 2020 david florczak. All rights reserved.
//

import SwiftUI

struct ResultDescriptionVIew: View {
    
    init() {
        UITableView.appearance().bounces = false
        
    }
    
    @State var descriptionText = String("""
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eleifend nisi non convallis sodales. Ut suscipit felis massa, ut gravida leo varius a. Cras ac lacus urna. Sed eget finibus purus. Vestibulum dolor ante, vehicula a scelerisque in, scelerisque eu felis. Aenean lobortis scelerisque metus sed accumsan. In dapibus faucibus dui, eget dictum ipsum. Fusce aliquam enim quis sodales luctu
    """)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.5)
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text("Described Item")
                            .font(Font.largeTitle)
                            .bold()
                        Spacer()
                        
                        List {
                            Text(self.descriptionText)
                                .bold()
                                .multilineTextAlignment(.leading)

                        }
                        .cornerRadius(20)
                        Spacer()
                    }
                    Spacer()
                }
                
            }.frame(minWidth: nil,
                    idealWidth: nil,
                    maxWidth: geometry.size.width*0.8,
                    minHeight: nil,
                    idealHeight: geometry.size.height/4,
                    maxHeight: geometry.size.height/3,
                    alignment: .center)
                .cornerRadius(20)
        }
        .background(Color.gray.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
        
        
        //        HStack {
        //            Spacer(minLength: 50)
        //            descriptionText
        //                .bold()
        //                .multilineTextAlignment(.leading)
        //                .fixedSize(horizontal: false, vertical: true)
        //                .padding(12)
        //                .background(
        //                    VStack {
        //                        Text("Described Item")
        //                            .font(Font.largeTitle)
        //                            .bold()
        //                            .offset(x: 0, y: -45)
        //                        Spacer()
        //                        RoundedRectangle(cornerRadius: 20)
        //                            .fill(Color.gray.opacity(0.9))
        //                    }.background(Color.gray.cornerRadius(20))
        //            )
        //            Spacer(minLength: 50)
        //        }
    }
}

struct ResultDescriptionVIew_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionVIew()
    }
}
