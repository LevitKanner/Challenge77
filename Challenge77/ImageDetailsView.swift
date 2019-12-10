//
//  ImageDetailsView.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ImageDetailsView: View {
    @State var image: ImageModel
    @State var viewDisplayed = 0
    var segments = ["Photo", "Map"]
    
    var body: some View {
        GeometryReader{ geometry in
            if self.viewDisplayed == 0{
            VStack{
                Text(self.image.name.uppercased())
                    .font(.largeTitle)
                    .padding()
                
                Divider()
                
                self.image.image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geometry.size.width)
                
                
                Spacer()
            }
            }else {
                MapView()
                    .edgesIgnoringSafeArea(.all)
            }
        }
        
        .navigationBarItems(trailing: Picker(selection: $viewDisplayed.animation(Animation.easeInOut), label: Text("view"), content: {
            ForEach(0..<segments.count){
                Text(self.segments[$0])
            }
        })
            .pickerStyle(SegmentedPickerStyle()))
            .navigationBarBackButtonHidden(self.viewDisplayed == 1)
    }
}
