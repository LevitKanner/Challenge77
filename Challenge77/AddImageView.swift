//
//  AddImageView.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct AddImageView: View {
    @State private var selectedImage: Image?
    @State private var showingImagePicker = false
    @State private var imageCaption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(alignment: .center){
                    ZStack{
                        Circle()
                            .fill(Color.white)
                        .frame(width: geometry.size.width * 0.9 , height: geometry.size.height * 0.5)
                        .padding()
                        
                        if self.selectedImage != nil{
                            self.selectedImage?
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            
                        }else{
                            Text("Tap to select image")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    self.showingImagePicker = true
                            }
                        }
                    }
                    
                    Section(header: Text("Caption")){
                        TextField("caption", text: self.$imageCaption)
                        .padding()
                            .overlay(Rectangle().stroke(Color.gray , lineWidth: 0.5))
                    }
                    .padding()
                    
                    
                    Button(action:{
                        //Perform saving function
                    }){
                        Text("Save to Library")
                        .foregroundColor(.white)
                            .background(Color.blue)
                        .padding()
                            .background(Color.blue)
                            
                    }
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black , lineWidth: 1))
                    .disabled(true)
                    
                    
                    Spacer()
                }
                .sheet(isPresented: self.$showingImagePicker) {
                    ImagePicker(selectedImage: self.$selectedImage)
                }
                
            }
            .navigationBarTitle("Add Image")
            .navigationBarItems(trailing: Button("cancel"){
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
