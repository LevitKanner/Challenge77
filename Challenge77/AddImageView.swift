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
                        if self.selectedImage != nil{
                            self.selectedImage
                        }else{
                            Circle()
                                .fill(Color.gray)
                                .frame(width: geometry.size.width * 0.9 , height: geometry.size.height * 0.6)
                                .padding()
                            
                            Text("Tap to select image")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    self.showingImagePicker = true
                            }
                        }
                    }
                    Section(header: Text("Caption")){
                        TextField("caption", text: self.$imageCaption)
                    }
                    .padding()
                    
                    Button(action:{
                        //Perform saving function
                    }){
                        Text("Save to Library")
                    }
                    Spacer()
                }
                .sheet(isPresented: self.$showingImagePicker) {
                    ImagePicker()
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
