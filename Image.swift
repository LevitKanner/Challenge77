//
//  Image.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageModel: Identifiable , Comparable , Codable{
    enum codingKeys: CodingKey{
        case id , image , name
    }
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.name < rhs.name
    }
    
    let id = UUID()
    var image: Image
    var name: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id.self, forKey: .id)
        try container.encode(name.self, forKey: .name)
    }
    
}



class Images: ObservableObject{
    @Published var images = [ImageModel]()
}
