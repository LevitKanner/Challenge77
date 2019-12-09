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
    var body: some View {
        GeometryReader{ geometry in
            
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
        }
    }
}
