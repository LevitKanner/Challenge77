//
//  ContentView.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var images = [ImageModel]()
    @State private var showingAddImageView = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(images) { image in
                    NavigationLink(destination: Text("Image coming")) {
                        HStack{
                            image.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black , lineWidth: 1))
                            
                            Text(image.name)
                        }
                    }
                }
            }
        .navigationBarTitle("Image Library")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action:{
                //Button action here...
                self.showingAddImageView = true
            }){
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddImageView) {
                    AddImageView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
