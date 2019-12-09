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
                .onDelete { (offsets) in
                    self.deleteRow(offsets: offsets)
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
                    AddImageView(images: self.images)
            }
        }
    }
    //Methods
    func deleteRow(offsets: IndexSet){
        self.images.images.remove(atOffsets: offsets)
    }
    
    func getFileDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadFromDirectory(){
        let url = getFileDirectory().appendingPathComponent("")
        do {
            let data =  try Data(contentsOf: url)
            images.images = try JSONDecoder().decode([ImageModel].self, from: data)
        }catch{
            debugPrint(error)
        }
    }
    
    func saveToDirectory(){
        let url = getFileDirectory().appendingPathComponent("")
        
        do {
            let data = try JSONEncoder().encode(self.images)
        }catch {
            debugPrint(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
