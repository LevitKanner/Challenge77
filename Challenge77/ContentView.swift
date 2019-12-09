//
//  ContentView.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var images = Images()
    @State private var showingAddImageView = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(images.images) { image in
                    NavigationLink(destination: ImageDetailsView(image: image)) {
                        HStack{
                            image.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44 , height: 44)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black , lineWidth: 0.5))
                            
                            Text(image.name)
                                .font(.system(size: 18))
                        }
                    }
                }
            }
            .navigationBarTitle("Image Library")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action:{
                //Button action here...
                self.showingAddImageView = true
                self.images.images.append(ImageModel(image: Image("cupcakes"), name: "truing"))
            }){
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddImageView) {
                    AddImageView(images: self.images)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
