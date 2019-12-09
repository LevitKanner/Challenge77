//
//  Image.swift
//  Challenge77
//
//  Created by Levit Kanner on 09/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageModel: Identifiable{
    let id = UUID()
    var image: Image
    var name: String
}
